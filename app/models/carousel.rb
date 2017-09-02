class Carousel < ActiveRecord::Base
  attr_accessible :body, :header, :banner, :dealer

  mount_uploader :banner, BannerUploader

  def self.banners
    where dealer: false
  end

  def self.offers
    where dealer: true
  end

end
