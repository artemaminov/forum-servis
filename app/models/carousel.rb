class Carousel < ActiveRecord::Base
  attr_accessible :body, :header, :banner, :dealer, :link, :new_window

  mount_uploader :banner, BannerUploader

end
