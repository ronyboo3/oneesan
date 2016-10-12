require 'cron/make_data_from_rss'
config = {
  consumer_key: 'OOLv7qbP9mFJgOLa05xz3EmzS',
  consumer_secret: '6xKOzK9h9Ny2hyK2JFre4uqOxIuDwXLwYRNTlbX097emq15rjF',
  access_token: '775221815887081472-ayCnuS5vikVdpwxB7lt2y38zBnyi3KZ',
  access_token_secret: 'x0Cr2nA5eumVF3U34ubti5Y9MDRC6rXQIzSfuQwqkItn8',
}

message = "ねぇねぇ、さっき聞いた話なんだけど・・・\n\n"

make_data_from_rss = MakeDataFromRss.new("omoshiro")
articles = make_data_from_rss.articles

title = articles[0]["title"]
if title.length > 40
  title = title[0, 40]
end
message += "「#{title}」\n\n"
message += "これ今話題の記事なんだって！\n\n"

message += "詳しくはこちら\n"
message += "http://bot-jp.com\n\n"
message += "#噂のお姉さん #まとめ #2ch"

client = Twitter::REST::Client.new(config)

client.update(message)
