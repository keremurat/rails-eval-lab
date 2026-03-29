require 'rails_helper'

RSpec.describe UserDataFetcher do
  describe '#call' do
    let!(:user) do
      User.create!(name: 'Test User', email: 'test@dojo.test', active: true).tap do |u|
        Profile.create!(user: u, bio: 'Bio text', avatar_url: 'https://example.com/avatar.png')
        post = u.posts.create!(title: 'Post title', body: 'Post body', published: true)
        post.comments.create!(author_name: 'Commenter', body: 'A comment')
      end
    end

    it 'returns consistent data structure' do
      result = described_class.new.call

      expect(result).to be_an(Array)
      expect(result).not_to be_empty

      sample_user = result.first
      expect(sample_user).to include(:name, :email, :profile, :posts)

      sample_post = sample_user[:posts].first
      expect(sample_post).to include(:title, :body, :published, :comments)

      expect(sample_post[:comments].first).to include(:author_name, :body)
    end
  end
end
