class Demand < Category

  embedded_in :idea
  has_many :tags

end