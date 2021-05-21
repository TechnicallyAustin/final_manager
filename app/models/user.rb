class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
# Validaitons
validates :name, presence: true 
validates :lname, presence: true 
validates :email, presence: true, uniqueness: true 
validates :password, presence: true 
validates :password_confirmation, presence: true 


# Associations

# Methods


end
