require 'cron/make_data_from_rss'
class IndexController < ApplicationController

  def index
    setParams(params[:category])
  end
  
  def adult
    setParams("adult")
    mdfr_pickup = MakeDataFromRss.new("pickup_adult")
    @pickup_articles = mdfr_pickup.articles
    addAd()
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

  def addAd
    article_with_ad = Hash.new
    article_with_ad["title"] = "こんな可愛くていいの？w 『凰 かなめ』AV界に進出！"
    article_with_ad["url"] = "http://www.dmm.co.jp/digital/videoa/-/detail/=/cid=118bgn00039/?i3_ref=list&i3_ord=5/oneesan0725-002"
    article_with_ad["img"] = "http://image.erovideos.info/fit?url=http%3A%2F%2Ffile.erovideos.info%2Fhttp%25253A%25252F%25252Fhiroba.avximg.com%25252Fjp-xvideos-av.com%25252F2016-09%25252Fthumb%25252FB5YOr3UnT07QUDVs.jpeg"
    @pickup_articles.insert(1, article_with_ad)
  end

end
