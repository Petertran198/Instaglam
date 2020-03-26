class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
  has_many :posts, dependent: :destroy #indicates that all the associated posts will be destroyed when user destroyed.
  serialize :following, Array #this is to trick the following attribute which is of text attribute to behave like an array so I can push users in 
  serialize :followers, Array
  validates :username, presence: true, uniqueness: { case_sensitive: false }, length: {maximum: 15}
  
  
  has_one_attached :avatar
end
