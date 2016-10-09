require 'cron/make_data_from_rss'

make_data_from_matome = MakeDataFromRss.new("omoshiro")
make_data_from_matome.create

make_data_from_horror = MakeDataFromRss.new("horror")
make_data_from_horror.create

make_data_from_entame = MakeDataFromRss.new("entame")
make_data_from_entame.create

make_data_from_game = MakeDataFromRss.new("game")
make_data_from_game.create

make_data_from_tec = MakeDataFromRss.new("tec")
make_data_from_tec.create
      
make_data_from_adult = MakeDataFromRss.new("adult")
make_data_from_adult.create
      
make_data_from_pickup = MakeDataFromRss.new("pickup")
make_data_from_pickup.create

make_data_from_pickup_adult = MakeDataFromRss.new("pickup_adult")
make_data_from_pickup_adult.create

