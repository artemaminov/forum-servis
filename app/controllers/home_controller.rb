class HomeController < ApplicationController
  def index
    require 'rubygems'
    require 'simple-rss'
    require 'open-uri'

    SimpleRSS.feed_tags << :"yandex:full-text"
    SimpleRSS.item_tags << :"yandex:full-text"
    rss = SimpleRSS.parse open('http://rosan.com/data/rss/37/')
    @brp_news = rss.items

    #rss.channel.title # => "Slashdot"
    #rss.channel.link # => "http://slashdot.org/"
    #rss.items.first.link # => "http://books.slashdot.org/article.pl?sid=05/08/29/1319236&amp;from=rss"
  end
end
