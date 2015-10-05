class Pizza
  include Mongoid::Document

  embedded_in :user

  field :type, type: String
  field :cheesy, type: Mongoid::Boolean
end
