require 'rails_helper'

RSpec.describe Post, type: :model do
  let(:user) { User.create(name: 'Tom', photo: 'https://unsplash.com/photos/F_-0BxGuVvo', bio: 'Teacher from Tigray', posts_counter: 0) }
  subject do
    Post.new(title: 'Hello', text: 'This is my first post', comments_counter: 0, likes_counter: 0, author: user)
  end

  before { subject.save }

  it 'should have an author' do
    expect(subject.author).to eq(user)
  end

  it 'should have a title' do
    subject.title = nil
    expect(subject).to_not be_valid
  end

  it 'should have a maximum title length of 250 characters' do
    subject.title = 'a' * 251
    expect(subject).to_not be_valid
  end

  it 'should have a non-negative comments counter' do
    subject.comments_counter = -1
    expect(subject).to_not be_valid
  end

  it 'should have a non-negative likes counter' do
    subject.likes_counter = -1
    expect(subject).to_not be_valid
  end

  describe '#update_post_counter' do
    it 'should increment the posts counter on the associated author' do
      expect { subject.update_post_counter }.to change { user.reload.posts_counter }.by(1)
    end
  end

  describe '#most_recent_comments' do
    let(:comment1) { Comment.create(text: 'Comment 1', author: user, post: subject) }
    let(:comment2) { Comment.create(text: 'Comment 2', author: user, post: subject) }
    let(:comment3) { Comment.create(text: 'Comment 3', author: user, post: subject) }
    let(:comment4) { Comment.create(text: 'Comment 4', author: user, post: subject) }
    let(:comment5) { Comment.create(text: 'Comment 5', author: user, post: subject) }

    it 'should return the five most recent comments on the post' do
      expect(subject.most_recent_comments).to contain_exactly(comment5, comment4, comment3, comment2, comment1)
    end
  end
end
