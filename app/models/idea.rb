class Idea
  include Mongoid::Document
  include Mongoid::Timestamps

  embeds_one :description
  embeds_one :problem
  embeds_one :solution
  embeds_one :market
  embeds_one :competition
  embeds_one :demand  

  has_many :tags
  belongs_to :user

  accepts_nested_attributes_for :description, :problem, :solution, :market, :competition

  field :id, type: String
  field :name, type: String, default: "untitled idea"

end
