class Carousel < ActiveRecord::Base
  attr_accessible :body, :header, :banner

  mount_uploader :banner, BannerUploader

end
