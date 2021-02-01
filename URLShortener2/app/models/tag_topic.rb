class TagTopic < ApplicationRecord
    validates :topic, presence: true, uniqueness: true

    has_many :taggings,
    primary_key: :id, 
    foreign_key: :tag_topic_id,
    class_name: :Tagging

    has_many :tagged_links,
    through: :taggings,
    source: :tagged_url

    def popular_links
        tagged_links.joins(:visits).group(:short_url, :long_url).order('number_of_visits DESC').select('long_url, shortened_urls.short_url, COUNT(visits.id) as "number_of_visits"').limit(5)

       
    end

end