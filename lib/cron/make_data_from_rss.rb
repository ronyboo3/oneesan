
require 'rss'

class MakeDataFromRss

  attr_accessor :file_path, :feed_url, :category

  def initialize(category)
    self.category = category
    if category == "omoshiro"
      self.file_path = "/usr/local/var/oneesan/public/data/rss_omoshiro.json"
      self.feed_url = "http://matome.naver.jp/feed/topic/1Hild"
    elsif category == "horror"
      self.file_path = "/usr/local/var/oneesan/public/data/rss_horror.json"
      self.feed_url = "http://matome.naver.jp/feed/topic/1Hilj"
    elsif category == "entame"
      self.file_path = "/usr/local/var/oneesan/public/data/rss_entame.json"
      self.feed_url = "http://matome.naver.jp/feed/topic/1HipB"
    elsif category == "game"
      self.file_path = "/usr/local/var/oneesan/public/data/rss_game.json"
      self.feed_url = "http://matome.naver.jp/feed/topic/1Hinm"
    elsif category == "tec"
      self.file_path = "/usr/local/var/oneesan/public/data/rss_tec.json"
      self.feed_url = "http://matome.naver.jp/feed/topic/1Himu"
    elsif category == "cat"
      self.file_path = "/usr/local/var/oneesan/public/data/rss_cat.json"
      self.feed_url = "http://matome.naver.jp/feed/topic/1Hioj"
    else
      self.file_path = "/usr/local/var/oneesan/public/data/rss_omoshiro.json"
      self.feed_url = "http://matome.naver.jp/feed/topic/1Hild"
    end
  end

  def create
    feed_urls = Feedbag.find self.feed_url
    feed = Feedjira::Feed.fetch_and_parse(feed_urls.first)
    p feed.entries[0]
    built_data = build_data(feed.entries)
    out_to_json(built_data)
  end

  def build_data(data)
    built_data = []
    data.each_with_index do |article, i|
      child = Hash.new
      child[:title] = article.title
      child[:url] = article.url
      child[:published_at] = article.published
      built_data.push(child)
      break if i == 15
    end
    return built_data
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
    elsif self.category == "cat"
      name = "ねこ"
    else
      name = "おもしろ"
    end
    return name
  end

end

