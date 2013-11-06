class Tag 
  include Mongoid::Document

  belongs_to :problem
  belongs_to :solution
  belongs_to :market
  belongs_to :competition
  belongs_to :demand
  belongs_to :idea

  field :name, type: String

  validates :name, presence: true

end