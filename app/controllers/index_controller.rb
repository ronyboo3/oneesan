require 'cron/make_data_from_rss'
class IndexController < ApplicationController

  def index
    category = params[:category] == nil ? "omoshiro" : params[:category]
    make_data_from_rss = MakeDataFromRss.new(category)
    @articles = make_data_from_rss.articles
    @category_name = make_data_from_rss.category_name
  end

end
