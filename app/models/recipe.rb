class Recipe < ApplicationRecord

  belongs_to :user
  has_many :comments, as: :commentable

  validates :user_id, presence: true
  validates :name, presence: true, length: { minimum: 3, maximum: 100 }
  validates :description, presence:true, length: { minimum: 3, maximum: 240 }

end
