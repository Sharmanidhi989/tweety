class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
  enum role: {:doctor => "Doctor", :patient => "Patient"}
  has_many :posts
  has_many :likes
  has_many :liked_posts, through: :likes, source: :post
  belongs_to :manager, foreign_key: :manager_id, class_name: 'User', optional: true
  has_many :employees, foreign_key: :manager_id, class_name: 'User', source: :user

  has_many :appointments
  has_many :doctors_relations, foreign_key: :doctor_id, class_name: 'Appointment'
  has_many :patients, through: :doctors_relations

  has_many :patients_relations, foreign_key: :patient_id, class_name: 'Appointment'
  has_many :doctors, through: :patients_relations
end
