class Tagging < ApplicationRecord
    validates :tag_topic_id, presence: true
    validates :short_url_id, presence: true

    belongs_to :tag_topic,
    primary_key: :id,
    foreign_key: :tag_topic_id,
    class_name: :TagTopic

    belongs_to :tagged_url,
    primary_key: :id,
    foreign_key: :short_url_id,
    class_name: :ShortenedUrl
end