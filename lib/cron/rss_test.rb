require 'cron/make_data_from_rss'

make_data_from_matome = MakeDataFromRss.new("pickup_adult")
make_data_from_matome.create
