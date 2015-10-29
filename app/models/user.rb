class User
  include Mongoid::Document


  has_many :jeans
  embeds_many :pizza
  has_secure_password

  field :first_name, type: String
  field :last_name, type: String
  field :email, type: String
  field :password_digest, type: String
  field :password_confirmation, type: String
  
  
  #validates :password, :presence => { :message}
  validates :password, :presence => true, length: {maximum: 20, too_long: "%{count} characters is the maximum allowed"}
  validates_confirmation_of :password, :on => :create, :message => "should match confirmation"
  validates :email, :presence => true, format: { with: /\A[^@\s]+@([^@.\s]+\.)+[^@.\s]+\z/ }
  validates_uniqueness_of :email
  validates :first_name, :presence => true
  validates :last_name, :presence => true

  validate :first_name_same_letter

  def first_name_same_letter
  	if first_name && last_name
  		if first_name.first != last_name.first
  			errors.add(:first_name, "Needs to have the same letter as last name:")
  		end
  	end
  end


end


