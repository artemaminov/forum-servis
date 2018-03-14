class HomeController < ApplicationController

  def index
    @banners = Carousel.all
    @pricelist = Pricelist.last
    respond_to do |format|
      format.html { @news = News.ordered }
      format.js { @news = News.next params[:news] }
    end
  end

end
