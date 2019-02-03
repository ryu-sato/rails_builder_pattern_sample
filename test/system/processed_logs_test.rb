require "application_system_test_case"

class ProcessedLogsTest < ApplicationSystemTestCase
  setup do
    @processed_log = processed_logs(:one)
  end

  test "visiting the index" do
    visit processed_logs_url
    assert_selector "h1", text: "Processed Logs"
  end

  test "creating a Processed log" do
    visit processed_logs_url
    click_on "New Processed Log"

    fill_in "All phase done", with: @processed_log.all_phase_done
    fill_in "Phase", with: @processed_log.phase
    click_on "Create Processed log"

    assert_text "Processed log was successfully created"
    click_on "Back"
  end

  test "updating a Processed log" do
    visit processed_logs_url
    click_on "Edit", match: :first

    fill_in "All phase done", with: @processed_log.all_phase_done
    fill_in "Phase", with: @processed_log.phase
    click_on "Update Processed log"

    assert_text "Processed log was successfully updated"
    click_on "Back"
  end

  test "destroying a Processed log" do
    visit processed_logs_url
    page.accept_confirm do
      click_on "Destroy", match: :first
    end

    assert_text "Processed log was successfully destroyed"
  end
end
