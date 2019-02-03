module User3
  class ReplaceCmdD
    def apply_to?(key = "", cmd_name, os_version)
      key == "user3" && cmd_name == "cmd_d"
    end

    def process_something(cmd_result)
      cmd_result.gsub(/hoge/, "user3")
    end
  end
end
