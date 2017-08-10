class HomeController < ApplicationController
  def index

    @banners = Carousel.where :dealer => false
    @offers_banners = Carousel.where :dealer => true
    @pricelist = Pricelist.first

  end
end
