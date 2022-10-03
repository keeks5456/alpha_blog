class User < ApplicationRecord
  before_save { self.email = email.downcase } # before we save the user we want to lowercase its email
  has_many :articles, dependent: :destroy 

  validates :username, presence: true, uniqueness: {case_sensitive: false}, length: { minimum: 3, maximum: 25}
  VALID_EMAIL_REGEX = /\A[\w+\-.]+@[a-z\d\-.]+\.[a-z]+\z/i # or use this URI::MailTo::EMAIL_REGEXP
  validates :email,  presence: true, uniqueness: {case_sensitive: false}, length: { maximum: 100 }, format: { with: VALID_EMAIL_REGEX }
  validates :password, length: { in: 6..20 }


  has_secure_password

  def is_email_valid?(email)
    email =~ VALID_EMAIL_REGEX
  end
end