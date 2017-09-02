class HomeController < ApplicationController

  def index
    @banners = Carousel.banners
    @offers_banners = Carousel.offers
    @pricelist = Pricelist.last
  end

end
