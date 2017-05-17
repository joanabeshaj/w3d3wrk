# == Schema Information
#
# Table name: shortened_urls
#
#  id         :integer          not null, primary key
#  user_id    :integer          not null
#  long_url   :string           not null
#  short_url  :string           not null
#  created_at :datetime
#  updated_at :datetime
#

class ShortenedUrl < ActiveRecord::Base

  validates :user_id, :long_url, presence: true
  validates :short_url, presence: true, uniqueness: true

  belongs_to :submitter,
    class_name: :User,
    foreign_key: :user_id,
    primary_key: :id

  










  def self.random_code

    result_code = SecureRandom.urlsafe_base64(16)

    while ShortenedUrl.exists?(short_url: result_code)
      result_code = SecureRandom.urlsafe_base64(16)
    end

    result_code
  end

  def self.create_with_user_and_long_url(user, long_url)
    ShortenedUrl.create!(
      user_id: user.id,
      long_url: long_url,
      short_url: ShortenedUrl.random_code
    )
  end



end
