class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
  # allows devise to register the user as an omniauthable model.
  devise :omniauthable, omniauth_providers: [:google_oauth2]
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
    # allows the creation of a user from the hash provided from Google.
    # creates a user or updates a User based on the provider and UID
    where(provider: auth.provider, uid: auth.uid).first_or_create do |user|
      user.token = auth.credentials.token
      user.expires = auth.credentials.expires
      user.expires_at = auth.credentials.expires_at
      user.refresh_token = auth.credentials.refresh_token
    end
  end

end
