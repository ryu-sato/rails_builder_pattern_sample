module User1
  module Manufacturer2
    class ReplaceCmdB
      def apply_to?(key: "", cmd_name:, os_version:)
        my_cmd = (key == "user1" && cmd_name == "cmd_b")
        return my_cmd if os_version.blank?

        ver = os_version.split('.')&.first
        my_cmd && os_version.present && ver != "14"
      end

      def process_something(cmd_result)
        cmd_result.gsub(/hoge/, "higeN14")
      end
    end
  end
end
