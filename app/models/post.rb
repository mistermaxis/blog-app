class Post < ApplicationRecord
  belongs_to :author, class_name: "User", foreign_key: "user_id"
  has_many :comments, class_name: "Comment", foreign_key: "post_id"
  has_many :likes, class_name: "like", foreign_key: "post_id"

  def increase_post_counter
    user = User.find(user_id)
    user.increment!(:posts_counter)
  end

  def recent_comments
    comments.order(created_at: :desc).limit(5)
  end
end
