class Log < ApplicationRecord
  has_many :processed_logs, inverse_of: :log
end
