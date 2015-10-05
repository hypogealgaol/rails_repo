class Jean
  include Mongoid::Document

  belongs_to :user
  
  field :maker, type: String
  field :denim, type: Mongoid::Boolean
  field :color, type: String
end
