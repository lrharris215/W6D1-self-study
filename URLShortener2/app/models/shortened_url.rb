class ShortenedUrl < ApplicationRecord
    validates :submitter_id, presence: true
    validates :short_url, presence: true, uniqueness: true
    validates :long_url, presence: true

    belongs_to :submitter,
    primary_key: :id,
    foreign_key: :submitter_id,
    class_name: 'User'

    def self.factory_create(user, long_url)
        ShortenedUrl.create!( 
            submitter_id: user.id, 
            long_url: long_url, 
            short_url: ShortenedUrl.random_code)
    end

    def self.random_code
        loop do
        code = SecureRandom::urlsafe_base64(8)
        return code unless ShortenedUrl.exists?(short_url: code)
        end
    end


end