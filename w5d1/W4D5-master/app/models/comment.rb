class Comment < ActiveRecord::Base
  validates :author, :post, :content, presence: true
  
  belongs_to :post
  belongs_to :author,
    class_name: :User,
    foreign_key: :user_id
end
