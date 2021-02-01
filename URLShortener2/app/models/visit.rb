class Visit < ApplicationRecord

    validates :visitor_id, presence: true
    validates :url_id, presence: true

   def self.record_visit!(user, shortened_url)

        Visit.create!(
            visitor_id: user.id,
            url_id: shortened_url.id
        )
    end

      
     belongs_to :visitor,
        class_name: :User,
        foreign_key: :visitor_id,
        primary_key: :id

     belongs_to :visited_url,
        primary_key: :id,
        foreign_key: :url_id,
        class_name: :ShortenedUrl
end