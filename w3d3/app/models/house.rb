class House < ApplicationRecord
  has_many(
    :residents,
    :class_name => "Person",
    :primary_key => :id
  )

  validates :address, :presence => true
end
