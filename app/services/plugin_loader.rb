class PluginLoader
  include Singleton

  attr_reader :plugins

  def initialize
    extension = 'rb'
    @plugins = []
    Dir.glob(File.join(plugin_dir_path, '**', "*.#{extension}")).each do |p|
      require p
binding.pry
      @plugins << Object.const_get(to_classname(p)).new
    end
  end

  private

    def to_classname(str)
      str.sub(/^#{plugin_dir_path}/){""}.sub(/\.rb$/){""}.gsub(/\/(.?)/) { "::" + $1.upcase }.gsub(/(^|_)(.)/) { $2.upcase }
    end

    def plugin_dir_path
      File.join(Rails.root, 'plugin')
    end
end
