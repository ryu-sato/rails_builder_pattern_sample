module User2
  module Manufacturer1
    class ReplaceCmdC
      def apply_to?(key = "", cmd_name, os_version)
        key == "user2" && cmd_name == "cmd_c"
      end

      def process_something(cmd_result)
        cmd_result.gsub(/hoge/, "user2")
      end
    end
  end
end
