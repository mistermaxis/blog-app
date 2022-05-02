class Like < ApplicationRecord
  belongs_to :author, class_name: "User", foreign_key: "user_id"
  belongs_to :post

  def increase_like_counter
    post = Post.find(post_id)
    post.increment!(:likes_counter)
  end
end
