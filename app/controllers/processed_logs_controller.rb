class ProcessedLogsController < ApplicationController
  load_and_authorize_resource

  before_action :set_processed_log, only: [:show, :edit, :update, :destroy]

  # GET /processed_logs
  # GET /processed_logs.json
  def index
    @processed_logs = ProcessedLog.all
  end

  # GET /processed_logs/1
  # GET /processed_logs/1.json
  def show
  end

  # GET /processed_logs/new
  def new
    @processed_log = ProcessedLog.new
  end

  # GET /processed_logs/1/edit
  def edit
  end

  # POST /processed_logs
  # POST /processed_logs.json
  def create
    @processed_log = ProcessedLog.new(processed_log_params)

    respond_to do |format|
      if @processed_log.save
        format.html { redirect_to @processed_log, notice: 'Processed log was successfully created.' }
        format.json { render :show, status: :created, location: @processed_log }
      else
        format.html { render :new }
        format.json { render json: @processed_log.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /processed_logs/1
  # PATCH/PUT /processed_logs/1.json
  def update
    respond_to do |format|
      if @processed_log.update(processed_log_params)
        format.html { redirect_to @processed_log, notice: 'Processed log was successfully updated.' }
        format.json { render :show, status: :ok, location: @processed_log }
      else
        format.html { render :edit }
        format.json { render json: @processed_log.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /processed_logs/1
  # DELETE /processed_logs/1.json
  def destroy
    @processed_log.destroy
    respond_to do |format|
      format.html { redirect_to processed_logs_url, notice: 'Processed log was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_processed_log
      @processed_log = ProcessedLog.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def processed_log_params
      params.require(:processed_log).permit(:phase, :all_phase_done)
    end
end
