class Tag 
  include Mongoid::Document

  belongs_to :category
  belongs_to :idea
  belongs_to :user

  field :id, type: String
  field :name, type: String

end