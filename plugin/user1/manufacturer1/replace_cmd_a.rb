module User1
  module Manufacturer1
    class ReplaceCmdA
      def apply_to?(key = "", cmd_name, os_version)
        my_cmd = (key == "user1" && cmd_name == "cmd_a")
        return my_cmd if os_version.blank?

        ver = os_version.split('.')&.first
        my_cmd && ver == "14"
      end

      def process_something(cmd_result)
        cmd_result.gsub(/hoge/, "hoge14")
      end
    end
  end
end
