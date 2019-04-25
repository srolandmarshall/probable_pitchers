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
  puts @pitchers
end

get_probable_pitchers_URL
read_pitchers
