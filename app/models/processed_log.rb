# == Schema Information
#
# Table name: processed_logs
#
#  id             :integer          not null, primary key
#  all_phase_done :boolean
#  content        :text
#  phase          :string
#  created_at     :datetime         not null
#  updated_at     :datetime         not null
#  log_id         :integer
#
# Indexes
#
#  index_processed_logs_on_log_id  (log_id)
#

class ProcessedLog < ApplicationRecord
  has_paper_trail

  belongs_to :log, inverse_of: :processed_logs
end
