class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable

  acts_as_voter
  has_many :posts

  has_many :users_posts, dependent: :destroy
  has_many :posts, through: :users_posts

end
