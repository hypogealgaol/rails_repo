class Jean
  include Mongoid::Document
  belongs_to :user
  field :maker, type: String
  field :denim, type: String
  validates :user_id, presence: true

end
