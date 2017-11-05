class HomeController < ApplicationController

  def index
    @banners = Carousel.all
    @pricelist = Pricelist.last
    @news = News.ordered
  end

end
