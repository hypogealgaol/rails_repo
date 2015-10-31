require 'bcrypt'

class User 
  include Mongoid::Document
  include Mongoid::Attributes::Dynamic #??
  include ActiveModel::SecurePassword

  has_many :jeans
  has_many :gyros
  has_many :lists
  has_secure_password

  field :first_name, type: String
  field :last_name, type: String
  field :email, type: String
  field :password, type: String
  field :password_digest, type: String
  field :password_confirmation, type: String
  field :privilege, type: Boolean
  
  
  validates :password, :confirmation =>true, :presence => true, length: {minimum: 6, maximum: 20, too_long: "%{count} characters is the maximum allowed"}
  #validates :password_confirmation, :presence =>true
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


