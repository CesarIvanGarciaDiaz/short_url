class Url < ActiveRecord::Base

  validates :long_url, :uniqueness => true
  validates :short_url, :uniqueness => true
  validate :valid_url

  def valid_url
    validates_format_of :long_url, :with => URI::regexp(%w(http https))
  end

  def self.generate_url
    var=(1..6).map{ ('a'..'z').to_a[rand(26)]}.join
    return var
  end

end
