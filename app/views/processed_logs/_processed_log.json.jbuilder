json.extract! processed_log, :id, :phase, :all_phase_done, :created_at, :updated_at
json.url processed_log_url(processed_log, format: :json)
