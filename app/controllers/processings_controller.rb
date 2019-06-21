class ProcessingsController < ApplicationController
  before_action :set_processing, only: [:show, :edit, :update, :destroy]

  # GET /processings/new
  def new
  end

  # POST /processings
  # POST /processings.json
  def create
    authorize! :manage, ProcessedLog

    seperator = '###PROMPT###'

    organization = 'user1'
    hostname = processing_log_params[:hostname]
    os_version = '15.0.3'

    log = Log.find(processing_log_params[:log_id])
    parsed_log = log.content.gsub(/^\[.*[0-9][0-9]:[0-9][0-9]:[0-9][0-9]\..*201[7|8|9]\] /, "")
      .gsub(/^\s*RP\/.*:#{hostname}#\s*/, seperator)                         # プロンプトごとにセパレータを付与。プロンプト内のホスト名は残さない(cisco_logedit.rbの踏襲))
      .gsub(/^(-+\s*show running-config[^-]+.*-+)$/, seperator + '\1')       # system.tech 内の show running-config コマンドを分割ポイントとする（'---(コマンド)---' となっている）
      .gsub(/^(\-{3,}\s*[^\[\]-]+\[[^\[\]]+\]\s*\-{3,})$/, '')               # showtechファイル内のコマンド終了行は不要なので削除
      .gsub(/^(\+{3,}\s*[^\[\]+]+\[[^\[\]]+\]\s*\+{3,})$/, seperator + '\1') # showtechファイル内のコマンド開始行ごとにセパレータを付与。開始行は残す(cisco_logedit.rbの踏襲)
      .split(seperator)

    cmd_logs = parsed_log.inject([]) do |cmd_logs, cmd|
      result = cmd.lines
      command_name = remove_prompt(result.first&.chomp, hostname)&.gsub(/\s*$/, '')

      # コマンドが空であれば無効な行としてスルー
      next cmd_logs if command_name.blank?

      cmd_logs << {
                    name:              command_name,
                    name_without_pipe: command_name.split('|').first.gsub(/\s*$/, ''),
                    result:            result.join
                  }
    end

    plugins = PluginLoader.instance.plugins
    cmd_logs.each do |cmd_log|
      appliers = plugins.select {|p| p.apply_to?(key: organization, cmd_name: cmd_log[:name], os_version: os_version) }

      appliers.each do |p|
        cmd_log[:result] = p.process_something(cmd_log[:result])
      end
    end
    new_content = cmd_logs.map {|cmd_log| cmd_log[:result]}.join

    processed_log = ProcessedLog.new(log: log, content: new_content)
    if processed_log.save
      redirect_to processed_log_path(processed_log), notice: 'ProcessedLog was successfully created.'
    else
      render :new
    end
  end

  private

    # Never trust parameters from the scary internet, only allow the white list through.
    def processing_log_params
      params.require(:processing).permit(:log_id, :hostname)
    end

    # プロンプトを削除する
    def remove_prompt(cmd_log_string, hostname)
      cmd_log_string&.gsub(/.*RP\/.*:#{hostname}#\s*/, '')
        &.gsub(/^\+{3,}\s*([^\[\]+]+)\[[^\[\]]+\]\s*\+{3,}$/, '\1')
        &.gsub(/^-+\s*(show running-config[^-]+).*-+$/, '\1')
    end
end
