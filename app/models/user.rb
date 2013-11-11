class User 
  include Mongoid::Document
  include Mongoid::Timestamps

  attr_accessor :password, :password_confirmation

  has_many :ideas

  field :id, type: String
  field :first_name, type: String
  field :last_name, type: String
  field :email, type: String
  field :username, type: String

  field :salt, type: String
  field :fish, type: String
  field :guest, type: Boolean


  before_save :encrypt_password

  validates :email, presence: true
  validates :email, uniqueness: { case_sensitive: false }
  validates :username, presence: true
  validates :username, uniqueness: { case_sensitive: false }
  validates :password, confirmation: true

  def authenticate(password)
    self.fish == BCrypt::Engine.hash_secret(password, self.salt)
  end
  
  def self.new_guest
    User.new(guest: true)
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

end