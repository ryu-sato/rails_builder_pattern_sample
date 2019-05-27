class Tagging < ApplicationRecord
  belongs_to :taggable, polymorphic: true
  belongs_to :tag, inverse_of: :taggings
end
