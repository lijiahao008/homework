class Post < ActiveRecord::Base
  validates :title, presence: true
  validates :subs, presence: true
  validates :author, presence: true

  has_many :post_subs,
      inverse_of: :post

  has_many :subs,
    through: :post_subs,
    source: :sub

  belongs_to :author,
    class_name: "User",
    foreign_key: :user_id

  has_many :comments
end
