require 'date'

module ProbablePitchers
  today = Date.today
  tomorrow = Date.today+1
  today_URL = "https://www.mlb.com/probable-pitchers/"+today.to_s
  tomorrow_URL = "https://www.mlb.com/probable-pitchers/"+tomorrow.to_s
  puts today_URL
  puts tomorrow_URL
end
