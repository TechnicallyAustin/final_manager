require 'bcrypt'
class User < ApplicationRecord
    include BCrypt
# Validaitons

has_secure_password
# Associations

# Methods
def password
end

def password=(new_password)
    # this setter method creates a password usuing Bcyrpt and creates a new secure password with the key to that hash being the original password.
    @password = Password.create(new_password)
    self.password_hash = @password
end

end
