class Category
  include Mongoid::Document
  include Mongoid::Timestamps
  
  field :content, type: String, default: "Nothing yet."

end