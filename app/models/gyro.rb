class Gyro
  include Mongoid::Document
  field :type, type: String
  field :tomato, type: Mongoid::Boolean
  belongs_to :user
  validates :user_id, presence: true

end
