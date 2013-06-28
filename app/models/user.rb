class User < ActiveRecord::Base
  attr_accessor :password

  before_save :encrypt_password

  validates :email, presence: true
  validates :email, uniqueness: true
  validates :email, format: { with: /\A([^@\s]+)@((?:[-a-z0-9]+\.)+[a-z]{2,})\Z/i, on: :create }
  validates :name, presence: true
  validates :name, uniqueness: true
  validates :username, presence: true
  validates :username, uniqueness: true
  validates :password, confirmation: true
  validates :password, length: 6..20
  validates :password, presence: { on: :create }

  has_many :blogs
  
  def self.authenticate(email, password)
    user = find_by_email(email)
    if user && user.password_hash == BCrypt::Engine.hash_secret(password, user.password_salt)
      user
    else
      nil
    end
  end
  
  def encrypt_password
    if password.present?
      self.password_salt = BCrypt::Engine.generate_salt
      self.password_hash = BCrypt::Engine.hash_secret(password, password_salt)
    end
  end
end
