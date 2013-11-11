class Category
  include Mongoid::Document
  include Mongoid::Timestamps
  
  field :content, type: String, default: "Click to edit."

end