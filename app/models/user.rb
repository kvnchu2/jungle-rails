class User < ActiveRecord::Base
  has_secure_password
  validates :email, uniqueness: true
  validates :password, length: { minimum: 6}
  def self.authenticate_with_credentials(email, password)
    new_email = email.strip.downcase
    user = User.find_by_email(new_email)
    if user && user.authenticate(password) 
      @user = user
    else 
      @user = nil
    end
  end
end
