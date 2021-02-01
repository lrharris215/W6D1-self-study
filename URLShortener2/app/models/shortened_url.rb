class ShortenedUrl < ApplicationRecord
    validates :user_id, presence: true
    validates :short_url, presence: true, uniqueness: true
    validates :long_url, presence: true

    def self.random_code
        code = SecureRandom::urlsafe_base64
        unless shortened_urls.exists?(:short_url => "#{code}")
            code = SecureRandom::urlsafe_base64
        end
        code
    end
end