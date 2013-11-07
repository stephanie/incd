class Name
  include Mongoid::Document

  embedded_in :user

  field :first
  field :last

  def full_name
    [self.first, self.last].compact.join(" ")
  end

end