class User < ApplicationRecord
  before_save { self.email = email.downcase } 
  # before w save the user we want to lowercase its email
  has_many :articles 

  validates :username, presence: true, uniqueness: {case_sensetive: false}, length: { minimum: 3, maximum: 25}
  # VALID_EMAIL_REGEX = /\A[\w+\-.]+@[a-z\d\-.]+\.[a-z]+\z/i or use this URI::MailTo::EMAIL_REGEXP
  validates :email,  presence: true, uniqueness: {case_sensetive: false}, length: { maximum: 100 }, format: { with: VALID_EMAIL_REGEX = /\A[\w+\-.]+@[a-z\d\-.]+\.[a-z]+\z/i }
  
  # validates :password, length: { in: 6..20 }

  def is_email_valid?(email)
    email =~ VALID_EMAIL_REGEX
  end

end