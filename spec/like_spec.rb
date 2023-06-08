require 'rails_helper'

RSpec.describe Like, type: :model do
  let(:user) { User.create(name: 'Tom', photo: 'https://unsplash.com/photos/F_-0BxGuVvo', bio: 'Teacher from Tigray', posts_counter: 0) }
  let(:post) do
    Post.create(title: 'Hello', text: 'This is my first post', comments_counter: 0, likes_counter: 0, author: user)
  end
  subject { Like.new(author_id: user.id, post_id: post.id) }

  before { subject.save }

  it 'should have an author' do
    expect(subject.author).to eq(user)
  end

  it 'should have a post' do
    expect(subject.post).to eq(post)
  end

  describe '#update_like_counter likes' do
    it 'should increment the likes counter on the associated post' do
      expect { subject.update_like_counter }.to change { post.reload.likes_counter }.by(1)
    end
  end
end
