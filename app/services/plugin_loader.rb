class PluginLoader
  include Singleton

  attr_reader :plugins

  def initialize
    @plugin_dir_base = './plugins'
    extension = 'rb'
    @plugins = []
    Dir.glob(@plugin_dir_base + "*.#{extension}").each do |p|
      require p
  binding.pry
      @plugins << Object.const_get(to_classname(p)).new
    end
  end

  private

  def to_classname(str)
    str.sub(/^#{@plugin_base}/){""}.sub(/\.rb$/){""}.gsub(/\/(.?)/) { "::" + $1.upcase }.gsub(/(^|_)(.)/) { $2.upcase }
  end
end
