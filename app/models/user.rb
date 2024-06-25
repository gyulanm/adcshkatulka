class User < ApplicationRecord
  include Devise::JWT::RevocationStrategies::JTIMatcher

  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable, :registerable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable,        
         :jwt_authenticatable, jwt_revocation_strategy: self

  has_many :posts
  #, dependent: :destroy
  has_many :comments
  #, dependent: :destroy
  has_one :profile
  #, dependent: :destroy

    has_many :favorites
    has_many :favorite_posts, through: :favorites, source: :post

  accepts_nested_attributes_for :profile

  after_create :create_profile

  def create_profile
    Profile.create(user_id: id, username: "кастом кастомович", about: "я делаю классный кастом!!!")
  end
end