module User3
  class ReplaceCmdD
    attr_reader :key, :cmd_name, :version

    def initialize
      @key = Tag.new(key: 'key', value: 'user3')
      @cmd_name = Tag.new(key: 'cmd_name', value: "cmd_d")
    end

    def apply_to?(key: "", cmd_name:, os_version:)
      key =~ Regexp.new(@key.value) \
        && cmd_name =~ Regexp.new(@cmd_name.value)
    end

    def process_something(cmd_result)
      cmd_result.gsub(/hoge/, "user3")
    end
  end
end
