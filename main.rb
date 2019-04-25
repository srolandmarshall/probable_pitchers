# Load the bundled environment
require "rubygems"
require "bundler/setup"
require 'date'

@today_URL = ""
@tomorrow_URL = ""
@pitchers = []


def get_probable_pitchers_URL (today = Date.today, tomorrow = Date.today+1)
  puts today
  puts tomorrow
  @today_URL = "https://www.mlb.com/probable-pitchers/"+today.to_s
  @tomorrow_URL = "https://www.mlb.com/probable-pitchers/"+tomorrow.to_s
end

def read_pitchers
  ht = Nokogiri::HTML(open(@tomorrow_URL))
  pitchers_data = ht.css("a.probable-pitchers__pitcher-name-link")
  pitchers_data.each do |pitcher|
    @pitchers << pitcher.text
  end
end

def make_url(pitcher)
  "https://baseball.fantasysports.yahoo.com/b1/40156/playersearch?&search="+pitcher.split(" ")[0]+"%20"+pitcher.split(" ")[1]
end

def tomorrows_pitchers
  @pitchers.each do |pitcher|
    Launchy.open(make_url(pitcher))
  end
end

def todays_pitchers_launch
  Launchy.open("https://baseball.fantasysports.yahoo.com/b1/40156/players?&sort=AR&sdir=1&status=A&pos=S_P&stat1=S_S_2019&jsenabled=1")
end

def tomorrows_names
  i = 1
  @pitchers.each do |pitcher|
    puts i.to_s+". "+pitcher
    i += 1
  end
end

def tomorrow_runtime
  puts "names or links?"
  n_o_l = gets
  case n_o_l.chomp
  when "links"
    tomorrows_pitchers
  when "names"
    tomorrows_names
  end
end

def by_player
  tomorrows_names
  puts "which number?"
  num_str = gets
  num = num_str.chomp.to_i
  player = @pitchers[num-1]
  Launchy.open(make_url(player))
end

def runtime
  b = true
  while b do
    puts "
    Welcome to my stupid app.
    today: for today's pitchers
    tomorrow: for options on tomorrow's pitchers
    tomorrows names: just their names
    player: gets tomorrows names, lets you launch their page
    exit: exits
    "
    command = gets
    case command.chomp
    when "today"
      todays_pitchers_launch
    when "tomorrow"
      tomorrow_runtime
    when "tomorrows names"
      tomorrows_names
    when "tomorrows links"
      tomorrows_pitchers
    when "player"
      by_player
    when "exit"
      b = false
      puts "goodbye."
    else
      puts "try again"
    end
  end
end

def app
  get_probable_pitchers_URL
  read_pitchers
  runtime
end

app
