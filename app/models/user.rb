class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable
  has_many :posts
  has_many :contributions
  has_many :bookmarks
  acts_as_voter

  validates :username, uniqueness: true
  validates_presence_of :username 

end
