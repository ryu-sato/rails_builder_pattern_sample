class Tag < ApplicationRecord
  has_many :taggings, inverse_of: :tag
end
