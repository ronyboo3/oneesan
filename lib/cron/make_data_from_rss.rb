
require 'rss'

class MakeDataFromRss

  attr_accessor :file_path, :feed_url, :category

  def initialize(category)
    self.category = category
    if category == "omoshiro"
      self.file_path = "/usr/local/var/oneesan/public/data/rss_omoshiro.json"
      self.feed_url = "http://alfalfalfa.com/index.rdf"
    elsif category == "horror"
      self.file_path = "/usr/local/var/oneesan/public/data/rss_horror.json"
      self.feed_url = "http://antenaplus.jp/okaruto/feed.rss"
    elsif category == "entame"
      self.file_path = "/usr/local/var/oneesan/public/data/rss_entame.json"
      self.feed_url = "http://matome.naver.jp/feed/topic/1HipB"
    elsif category == "game"
      self.file_path = "/usr/local/var/oneesan/public/data/rss_game.json"
      self.feed_url = "http://www.4gamer.net/rss/index.xml"
    elsif category == "tec"
      self.file_path = "/usr/local/var/oneesan/public/data/rss_tec.json"
      self.feed_url = "http://weekly.ascii.jp/cate/1/rss.xml"
    elsif category == "adult"
      self.file_path = "/usr/local/var/oneesan/public/data/rss_adult.json"
      self.feed_url = "http://korewaeroi.com/feed"
    elsif category == "pickup"
      self.file_path = "/usr/local/var/oneesan/public/data/rss_pickup.json"
      self.feed_url = "http://matome.naver.jp/humor"
    elsif category == "pickup_adult"
      self.file_path = "/usr/local/var/oneesan/public/data/rss_pickup_adult.json"
      self.feed_url = "http://movie.eroterest.net/feed/rss.xml"
    else
      self.file_path = "/usr/local/var/oneesan/public/data/rss_pickup.json"
      self.feed_url = "http://news.2chblog.jp/index.rdf"
    end
  end

  def create
    feed_urls = Feedbag.find self.feed_url
    feed = Feedjira::Feed.fetch_and_parse(feed_urls.first)
    built_data = build_data(feed.entries)
    p built_data
    out_to_json(built_data)
  end

  def build_data(data)
    built_data = []
    data.each_with_index do |article, i|
      child = Hash.new
      child[:title] = article.title
      child[:url] = article.url
      if article.image == nil
        child[:img] = image_path(article.summary)
      else
        child[:img] = article.image
      end
      child[:published_at] = article.published
      built_data.push(child)
      break if i == 15
      break if i == 5 && self.category == "adult" 
    end
    return built_data
  end

  def image_path(img_tag)
    return URI.extract(img_tag).first
  end

  def out_to_json(feed)
    f = File.open(self.file_path, 'w')
    f.puts feed.to_json
    f.close
    return
  end

  def articles
    f = File.open(self.file_path, 'r')
    json_str = f.read
    f.close
    return JSON.parse(json_str)
  end

  def category_name
    if self.category == "omoshiro"
      name = "おもしろ"
    elsif self.category == "horror"
      name = "洒落怖"
    elsif self.category == "entame"
      name = "エンタメ"
    elsif self.category == "game"
      name = "ゲーム"
    elsif self.category == "tec"
      name = "テクノロジー"
    elsif self.category == "adult"
      name = "アダルト"
    else
      name = "おもしろ"
    end
    return name
  end

  def category_color
    if self.category == "omoshiro"
      color = "87CEEB"
    elsif self.category == "horror"
      color = "9370DB"
    elsif self.category == "entame"
      color = "F0E68C"
    elsif self.category == "game"
      color = "98FB98"
    elsif self.category == "tec"
      color = "DCDCDC"
    elsif self.category == "adult"
      color = "FFC0CB"
    else
      color = "87CEEB"
    end
    return color
  end

end

