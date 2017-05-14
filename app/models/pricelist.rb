class Pricelist < ActiveRecord::Base
  attr_accessible :filename

  mount_uploader :filename, PricelistUploader
end
