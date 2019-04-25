# Probable Pitcher Streamer

Probable Pitchers is a stupid ruby app I made to automatically launch my league's probable pitchers

## Requirements

You need Ruby for this. If you have a mac, you should have it already? Not really sure

If you're on Windows, go here: https://rubyinstaller.org/ and follow the steps to install it.

## Installation

1. download it
1. unzip it
1. open your command line (space+command and type `terminal` for Mac or https://www.howtogeek.com/235101/10-ways-to-open-the-command-prompt-in-windows-10/ for Windows)
1. type `cd` then drag the unzipped folder to your terminal window
1. type `bundle install` into command line if you get an error here. maybe try `gem install bundler` first.
1. if the above worked, type `ruby main.rb` and i think it should do everything.

## Usage
if you get it running, there's a menu. here are your options

### Commands:
* `league`: changes the league ID if you want to use this for another league. you'll probably want to do this first if you aren't in my league.
* `today`: for today's pitchers
* `player`: gets tomorrows names, lets you launch their page
* `tomorrow`: for more options on tomorrow's pitchers, such as:
    * `tomorrows links`: will launch all the probable pitchers profiles at once in your browser (don't do this unless you can handled like 20 tabs opening at once)
    * `tomorrows names`: just their names
* `exit`: exits

follow other prompts as necessary.

Demo available here: https://github.com/srolandmarshall/probable_pitchers/blob/master/fantasy_app.mov?raw=true

## Contributing

I want to make this work with Yahoo's fantasy sports API. That should make us able to find probable pitchers into the future that are also Free Agents. Needs OAuth support and probably rails.

## License
[MIT](https://choosealicense.com/licenses/mit/)
