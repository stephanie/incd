class Category
  include Mongoid::Document
  include Mongoid::Timestamps

  embedden_in :idea
  has_many :tags
  belongs_to :user

  field :id, type: String
  field :name, type: String
  field :entry, type: String

end