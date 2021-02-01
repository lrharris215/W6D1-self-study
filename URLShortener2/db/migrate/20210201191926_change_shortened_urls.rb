class ChangeShortenedUrls < ActiveRecord::Migration[5.2]
  def change
    rename_column :shortened_urls, :user_id, :submitter_id
  end
end
