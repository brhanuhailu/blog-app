class Like < ApplicationRecord
    belongs_to :author, foreign_key: :author_id, class_name: :'User'
    belongs_to :post, foreign_key: :post_id, class_name: :'Post'

    after_create :update_like_counter

    def update_like_counter
        post.increment!(:likes_counter)
    end
end