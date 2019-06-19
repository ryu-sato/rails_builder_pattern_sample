# == Schema Information
#
# Table name: taggings
#
#  id            :integer          not null, primary key
#  taggable_type :string
#  created_at    :datetime         not null
#  updated_at    :datetime         not null
#  tag_id        :integer
#  taggable_id   :integer
#
# Indexes
#
#  index_taggings_on_tag_id                         (tag_id)
#  index_taggings_on_taggable_type_and_taggable_id  (taggable_type,taggable_id)
#

class Tagging < ApplicationRecord
  belongs_to :taggable, polymorphic: true
  belongs_to :tag, inverse_of: :taggings
end
