require 'rails_helper'

RSpec.describe User, type: :model do
  subject { User.new(name: 'Tom', photo: 'https://unsplash.com/photos/F_-0BxGuVvo', bio: 'Teacher from Tigray', posts_counter: 0) }

  before { subject.save }

  it 'should have a name' do
    subject.name = nil
    expect(subject).to_not be_valid
  end

  it 'should have a photo' do
    subject.photo = nil
    expect(subject).to_not be_valid
  end

  it 'should have a bio' do
    subject.bio = nil
    expect(subject).to_not be_valid
  end

  it 'should have a non-negative posts counter' do
    subject.posts_counter = -1
    expect(subject).to_not be_valid
  end

  describe '#most_recent_posts' do
    let(:post1) do
      Post.create(title: 'Post 1', text: 'This is my first post', comments_counter: 0, likes_counter: 0,
                  author: subject)
    end
    let(:post2) do
      Post.create(title: 'Post 2', text: 'This is my second post', comments_counter: 0, likes_counter: 0,
                  author: subject)
    end
    let(:post3) do
      Post.create(title: 'Post 3', text: 'This is my third post', comments_counter: 0, likes_counter: 0,
                  author: subject)
    end
    let(:post4) do
      Post.create(title: 'Post 4', text: 'This is my fourth post', comments_counter: 0, likes_counter: 0,
                  author: subject)
    end

    it 'should return the three most recent posts by the user' do
      expect(subject.most_recent_posts).to contain_exactly(post3, post2, post1)
    end
  end
end
