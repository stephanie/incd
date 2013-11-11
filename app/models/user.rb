class User 
  include Mongoid::Document
  include Mongoid::Timestamps

  attr_accessor :password, :password_confirmation

  has_many :ideas

  before_save :encrypt_password
  before_save :downcase_email

  field :id, type: String
  field :first_name, type: String
  field :last_name, type: String
  field :email, type: String
  field :username, type: String

  field :salt, type: String
  field :fish, type: String
  field :guest, type: Boolean

  # For password reset
  field :code, type: String
  field :expires_at, type: Time

  validates :email, presence: true
  validates :email, uniqueness: { case_sensitive: false }
  validates :email, format: { with: /\A[A-Z0-9._%+-]+@[A-Z0-9.-]+\.[A-Z]{2,4}\Z/i }
  validates :username, presence: true
  validates :username, uniqueness: { case_sensitive: false }
  validates :password, confirmation: true
  validates :password_confirmation, presence: true

  def self.authenticate(username, password)
    user = User.find_by(username: username)
    user.password_matches?(password) if user
  end

  def password_matches?(password)
    return self if self.fish == BCrypt::Engine.hash_secret(password, self.salt)
  end
  
  def self.new_guest
    User.new(guest: true)
  end

  def set_password_reset
    self.code = SecureRandom.urlsafe_base64
    set_expiration
    self.save!
  end

  def reset_password(password_params)
    if self.update(password_params)
      self.unset(:code)
      self.unset(:expires_at)
      true
    end
  end

  def set_expiration
    self.expires_at = PASSWORD_RESET_EXPIRES.from_now
  end

  def name
    guest ? "Guest" : username
  end

  private
  
  def encrypt_password
    if password.present?
      self.salt = BCrypt::Engine.generate_salt
      self.fish = BCrypt::Engine.hash_secret(password, self.salt)
    end
  end

  def downcase_username
    self.username.downcase!
  end

end