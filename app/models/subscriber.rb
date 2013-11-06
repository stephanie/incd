class Subscriber 
  include Mongoid::Document
  include Mongoid::Timestamps
  
  field :id, type: String
  field :email, type: String

  validates :email, presence: true
  validates :email, uniqueness: true

end