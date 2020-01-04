class Tweet < ApplicationRecord
  belongs_to :user

  scope :feeds, -> (user) { where(user_id: [user, user.followings].flatten) }
end
