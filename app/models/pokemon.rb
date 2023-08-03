class Pokemon < ApplicationRecord
  has_many :indices
  belongs_to :generation
end
