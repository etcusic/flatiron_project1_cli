CLI app that scrapes data from NFL network's main page to provide roster info for all 32 teams.

Install Instructions: Simply clone this repo, and then access 'bin/executable.rb' in your command line ('ruby bin/executable.rb'). Make sure that the file bin/executable.rb has the following code:

nfl = League.new({name: "NFL", url: "https://www.nfl.com/network/"})

Interaction.new(nfl)


Contributor's guide:
Add whatever you like, and I'll look at it when I can.


Link to liscence: https://github.com/etcusic/flatiron_cli/blob/master/LICENSE