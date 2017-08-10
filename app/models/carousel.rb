class Carousel < ActiveRecord::Base
  attr_accessible :body, :header, :banner, :dealer

  mount_uploader :banner, BannerUploader

end
