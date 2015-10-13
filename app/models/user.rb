class User
  include Mongoid::Document

  has_many :jeans
  embeds_many :pizza

  field :first_name, type: String
  field :last_name, type: String
  field :email, type: String
  field :password, type: String #not encrypted

  #validates :password, :presence => { :message}
  validates :password, :presence => true, length: {maximum: 20, too_long: "%{count} characters is the maximum allowed"}
  validates :email, :presence => true, format: { with: /\A[^@\s]+@([^@.\s]+\.)+[^@.\s]+\z/ }
  

end


