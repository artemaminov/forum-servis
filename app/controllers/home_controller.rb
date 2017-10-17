class HomeController < ApplicationController

  def index
    @banners = Carousel.all
    @pricelist = Pricelist.last
  end

end
