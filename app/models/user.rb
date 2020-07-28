class User < ActiveRecord::Base
  has_secure_password
  validates :email, uniqueness: true, format: { with: URI::MailTo::EMAIL_REGEXP } 
  validates :name, presence: true
  validates_length_of :password, minimum: 5, on: :create

  def self.authenticate_with_credentials(email, password)
    email = email.strip
    user = User.where('lower(email) = ?', email.downcase).first
    if user.authenticate(password)
      user
    else
      nil
    end

  end
end
