class List
  include Mongoid::Document
  belongs_to :user
  validates :user_id, presence: true

end
