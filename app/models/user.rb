class User < ApplicationRecord
  has_secure_password
  belongs_to :city
  has_many :gossips
  validates :first_name, presence: true
  validates :email, presence: true, uniqueness: true, format: { with: URI::MailTo::EMAIL_REGEXP }
  validates :city, presence: true
  validates :password, presence: true

end
