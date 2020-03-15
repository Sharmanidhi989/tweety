class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
  has_many :posts
  has_many :likes
  has_many :liked_posts, through: :likes, source: :post
  belongs_to :manager, foreign_key: :manager_id, class_name: 'User'
  has_many :employees, foreign_key: :manager_id, class_name: 'User',
           source: :user
end
