class User < ActiveRecord::Base
  has_secure_password

  validates :name, presence: true
  validates :email, presence: true
  validates :email, uniqueness: { case_sensitive: false }

  validates :password, length: {
    minimum: 6,
    message: 'password is too short'
  }
  validate :password_inputted_twice

  def self.authenticate_with_credentials(email, password)
    user = User.find_by_email(email)
    if user && user.authenticate(password)
      user
    else
      nil
    end
  end
end


def password_inputted_twice
  if password != password_confirmation
    errors.add(:password, 'has to be the same!!')
  end
end
