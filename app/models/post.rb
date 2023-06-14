class Post < ApplicationRecord
  belongs_to :author, foreign_key: :author_id, class_name: :User
  has_many :comments, foreign_key: :post_id, class_name: :Comment
  has_many :likes, foreign_key: :post_id, class_name: :Like

  after_create :update_post_counter

  validates :title, presence: true, length: { maximum: 250 }

  def update_post_counter
    author.increment!(:posts_counter)
  end

  def most_recent_comments
    comments.order(created_at: :desc).limit(5)
  end
end

## end of file ##
