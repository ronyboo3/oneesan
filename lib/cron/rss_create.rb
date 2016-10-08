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
      
make_data_from_cat = MakeDataFromRss.new("cat")
make_data_from_cat.create

