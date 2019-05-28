module User1
  module Manufacturer1
    class ReplaceAllCmd
      attr_reader :os_type, :version

      def initialize
        @os_type = Tag.new(key: 'os_type', value: 'JUNOS')
        @version = Tag.new(key: 'version', value: '1[34]')
      end

      def apply_to?(key: "", cmd_name:, os_version:)
        os_version =~ Regexp.new(@os_type.value)
      end

      def process_something(cmd_result)
        cmd_result.gsub('Fan RPM', "**DELETED**")
      end
    end
  end
end
