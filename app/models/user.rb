class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable,
         :omniauthable, omniauth_providers: [:google_oauth2]
# Validaitons
    validates :name, presence: true  
    validates :email, presence: true, uniqueness: true 
    validates :password, presence: true 
    validates :password_confirmation, presence: true unless 
# Associations
  has_many :tasklists
  has_many :tasks, through: :tasklists
  has_many :groups, through: :tasks

  # Methods
  def full_name
    #if last name ends in an s add ' after.
    # else add the ' before s
    p "#{self.name} #{self.lname}"
  end

  def self.from_google(access_token)
    data = access_token.info
    user = User.where(email: data['email']).first
  
    # users are created if they don't exist
      unless user
        user = User.create(name: data['name'],
            email: data['email'],
            #password: Devise.friendly_token[0,20],
            # Added SecureRandom to bypass password confirmation validation for my User model.
            password: SecureRandom
          )
      end
    user
  end

  
end
