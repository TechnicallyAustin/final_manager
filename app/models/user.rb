class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable,
         :omniauthable, omniauth_providers: [:google_oauth2]
# Validaitons
    validates :name, presence: true 
    validates :lname, presence: true 
    validates :email, presence: true, uniqueness: true 
    validates :password, presence: true 
    validates :password_confirmation, presence: true 
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

  def self.from_omniauth(auth)
    where(provider: auth.provider, uid: auth.uid).first_or_create do |user|
      user.provider = auth.provider
      user.uid = auth.uid
      user.email = auth.info.email
      user.password = Devise.friendly_token[0,20]
    end
  end

  
end
