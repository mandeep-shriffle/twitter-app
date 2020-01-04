class Follow < ApplicationRecord
  belongs_to :user
  belongs_to :followed_user, class_name: "User"


  validates :user_id, uniqueness: { scope: [:followed_user_id], message: "Already following." }
  scope :followers, -> (user_id) { where('followed_user_id = ?', user_id) }
end
