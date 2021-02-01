class User < ApplicationRecord
    validates :email, presence: true, uniqueness: true

    has_many :submitted_urls,
    primary_key: :id,
    foreign_key: :submitter_id,
    class_name: :ShortenedUrl

    has_many :visits,
    primary_key: :id,
    foreign_key: :visitor_id,
    class_name: :Visit

    has_many :visited_urls,
    -> { distinct },
    through: :visits,
    source: :visited_url

    def self.factory_create(email)
        begin
        User.create!(email: email)
        rescue
            retry
        end
    end
end