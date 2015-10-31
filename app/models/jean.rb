class Jean

	#use bootstrap on the frontend
  include Mongoid::Document

  belongs_to :user
  
  field :maker, type: String
  field :denim, type: Mongoid::Boolean
  field :color, type: String

  validates :maker, :presence => true
  validates :user_id, presence: true



end
