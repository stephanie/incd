class Idea
  include Mongoid::Document
  include Mongoid::Timestamps

  embeds_many :categories
  has_many :tags
  belongs_to :user

  field :id, type: String
  field :name, type: String

end
