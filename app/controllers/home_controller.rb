class HomeController < ApplicationController
  def index

    @banners = Carousel.all
    @pricelist = Pricelist.first

  end
end
