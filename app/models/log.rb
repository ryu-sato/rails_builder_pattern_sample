# == Schema Information
#
# Table name: logs
#
#  id         :integer          not null, primary key
#  content    :text
#  created_at :datetime         not null
#  updated_at :datetime         not null
#

class Log < ApplicationRecord
  has_many :processed_logs, inverse_of: :log
end
