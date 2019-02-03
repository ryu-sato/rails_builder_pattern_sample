module ReplaceCmdA do
  def apply_to?(key = "", cmd_name, os_version)
    my_cmd = key == "user1" && cmd_name == "cmd_a"
    return my_cmd if os_version.blank?

    os_version.split('.')&.first
    my_cmd && os_version == "14"
  end

  def process_something(cmd_result)
    cmd_result.gsub(/hoge/, "hoge14")
  end
end
