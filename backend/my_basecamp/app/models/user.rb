class User < ApplicationRecord
  has_many :projects
  attr_accessor :password
  validates_confirmation_of :password

  validates :name, presence: true
  validates :email, presence: true, uniqueness: { case_sensitive: false }, format: { with: URI::MailTo::EMAIL_REGEXP }
  validates :password, presence: true, length: {minimum: 6, too_short: "Must at least 6 characters long"}

  before_save :encrypt_password
  enum role: [:user, :admin]

  after_initialize do
    if self.new_record?
      self.role ||= :user
    end
  end

  def encrypt_password
    self.password_salt = BCrypt::Engine.generate_salt
    self.password_hash = BCrypt::Engine.hash_secret(password, password_salt)
  end

  def self.authenticate(email, password)
    user = User.find_by "email = ?", email
    if user && user.password_hash == BCrypt::Engine.hash_secret(password, user.password_salt)
      user
    else
      nil
    end
  end
end
