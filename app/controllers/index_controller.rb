require 'cron/make_data_from_rss'
class IndexController < ApplicationController

  def index
    setParams(params[:category])
  end
  
  def adult
    setParams("adult")
    mdfr_pickup = MakeDataFromRss.new("pickup_adult")
    @pickup_articles = mdfr_pickup.articles
  end

  private

  def setParams(category_name)
    category = category_name == nil ? "omoshiro" : category_name
    make_data_from_rss = MakeDataFromRss.new(category)
    @articles = make_data_from_rss.articles
    @category_name = make_data_from_rss.category_name
    @category_color = make_data_from_rss.category_color
    mdfr_pickup = MakeDataFromRss.new("pickup")
    @pickup_articles = mdfr_pickup.articles
  end

end
