class RemoveShortenedIndex < ActiveRecord::Migration
  def change
    remove_index :shortened_urls, :long_url
  end
end
