module User1
  module Manufacturer2
    class ReplaceCmdA
      attr_reader :key, :cmd_name, :version

      def initialize
        @key = Tag.new(key: 'key', value: 'user1')
        @cmd_name = Tag.new(key: 'cmd_name', value: "cmd_a")
        @version = Tag.new(key: 'version', value: '14.*')
      end

      def apply_to?(key: "", cmd_name:, os_version:)
        key =~ Regexp.new(@key.value) \
          && cmd_name =~ Regexp.new(@cmd_name.value) \
          && os_version =~ Regexp.new(@version.value)
      end

      def process_something(cmd_result)
        cmd_result.gsub(/hoge/, "hige14")
      end
    end
  end
end
