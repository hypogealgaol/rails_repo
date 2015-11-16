class Pant
  include Mongoid::Document
  field :maker, type: String
  field :quality, type: String
  belongs_to :user
  validates :user, :presence => true

end
