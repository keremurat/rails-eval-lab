require 'rails_helper'

RSpec.describe UserDataFetcher do
  describe '#call' do
    it 'returns consistent data structure' do
      result = described_class.new.call

      expect(result).to be_an(Array)
      
      # Just to ensure we're getting correctly structured data from the service
      if result.any?
        sample_user = result.first
        
        expect(sample_user).to include(:name, :email, :profile, :posts)
        
        if sample_user[:posts].any?
          sample_post = sample_user[:posts].first
          expect(sample_post).to include(:title, :body, :published, :comments)
          
          if sample_post[:comments].any?
            expect(sample_post[:comments].first).to include(:author_name, :body)
          end
        end
      end
    end
  end
end
