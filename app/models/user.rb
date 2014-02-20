class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable

    validates :first_name, presence: true
    validates :last_name, presence: true
    validates :profile_name, presence: true, uniqueness: true, format: { with: /[a-zA-Z0-9_-]*/, message:'must be formatted correctly.'}


	def full_name
  		first_name + " " + last_name
  	end

  	has_many :statuses
    has_many :user_friendships
    has_many :friends, through: :user_friendships
end
  
 
