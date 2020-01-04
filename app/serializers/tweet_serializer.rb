class TweetSerializer < ActiveModel::Serializer
  attributes :id, :body, :user_id
end
