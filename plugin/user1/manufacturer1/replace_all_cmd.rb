module User1
  module Manufacturer1
    class ReplaceAllCmd
      def apply_to?(key: "", cmd_name:, os_version:)
        true  # apply to ALL commands.
      end

      def process_something(cmd_result)
        cmd_result.gsub('Fan RPM', "**DELETED**")
      end
    end
  end
end
