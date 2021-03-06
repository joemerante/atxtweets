# Archive tweets using the Twitter API

In-progress deployed version [here](http://atxtweets.herokuapp.com/)

Since Twitter search results don't last forever, I set up this site to archive tweets with hashtag #cfaATX. Also, I wanted an opportunity to play with the Twitter gem. As always, great pointers and framework from Ryan Bates, see [Railscast Episode 359](http://railscasts.com/episodes/359-twitter-integration).

If you just need a widget to embed on your site, you can create a new Twitter widget [here](https://twitter.com/settings/widgets/new) by "Choosing a timeline source" and picking a user's timeline, favorites list, list, or search results. The resulting code can be dropped into any site. Include 'www.' in the Domain depending on your server set up, or just include the url with and without it. Note that these widgets allow interactions, which is cool!


Things to note:  
*You'll need a PostgreSQL 'bigint' data type to store the tweet_id of each tweet. I did it through a migration, you might want to put it right into your schema and remove the migration file before running `rake db:setup`.  
*Note that Twitter limits unauthenticated requests to 150/hr. You can authenticate and increase that, but for the basic search thing this app does (as of the initial commit), it doesn't seem necessary. If a request is returning nothing, especially while first testing/playing, try this in the Rails console: `Twitter.rate_limit_status`  
*If running the app locally, run `rake fetch` to grab tweets. On Heroku, set up the [Scheduler add-on](https://devcenter.heroku.com/articles/scheduler).  
*To output the tweets to a csv file, run `bundle exec rails runner "eval(File.read 'csv_dump.rb')"`. Add column headings to the csv as needed - note that the ID is the primary key, whereas the tweet_id is.. you guessed it, the tweet's id on Twitter. The default filename outputted by the csv_dump.rb script, named tweets.csv, is in the .gitignore file so it stays only on your machine. Adjust .gitignore, file output path and the script as needed - you might want to only append new tweets to the same csv, create a new csv each time, etc.


Resources:  
[Railscast Episode 359](http://railscasts.com/episodes/359-twitter-integration)  
[Twitter gem](https://github.com/sferik/twitter)  
[Twitter gem docs](http://rdoc.info/gems/twitter)  
[Twitter search API](https://dev.twitter.com/docs/api/1/get/search)

Requires Ruby 1.9.2 or later to run.
