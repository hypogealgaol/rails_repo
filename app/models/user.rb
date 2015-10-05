class User
  include Mongoid::Document

  has_many :jeans
  embeds_many :pizza

  field :first_name, type: String
  field :last_name, type: String
  field :email, type: String
  field :password, type: String #not encrypted
end


