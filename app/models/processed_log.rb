class ProcessedLog < ApplicationRecord
  belongs_to :log, inverse_of: :processed_logs
end
