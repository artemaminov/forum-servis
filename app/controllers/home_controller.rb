class HomeController < ApplicationController
  def index

    Feedjira::Feed.add_common_feed_entry_element('yandex:full_text', :as => :yandex)
    @brp_news = Feedjira::Feed.fetch_and_parse("http://rosan.com/data/rss/37/")

  end
end
