class HomeController < ApplicationController
  def index

    Feedjira::Feed.add_common_feed_entry_element('yandex:full_text', :as => :yandex)
    @banners = Carousel.all
    @pricelist = Pricelist.first

  end
end
