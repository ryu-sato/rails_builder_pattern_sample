module User2
  module Manufacturer1
    class ReplaceCmdC
      attr_reader :key, :cmd_name, :version

      def initialize
        @key = Tag.new(key: 'key', value: 'user2')
        @cmd_name = Tag.new(key: 'cmd_name', value: "cmd_c")
      end

      def apply_to?(key: "", cmd_name:, os_version:)
        key =~ Regexp.new(@key.value) \
          && cmd_name =~ Regexp.new(@cmd_name.value)
      end

      def process_something(cmd_result)
        cmd_result.gsub(/hoge/, "user2")
      end
    end
  end
end
