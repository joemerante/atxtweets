# Archive tweets using the Twitter API

In-progress deployed version [here](http://atxtweets.herokuapp.com/)

Since Twitter search results don't last forever, I set up this site to archive tweets with hashtag #cfaATX. Also, I wanted an opportunity to play with the Twitter gem. As always, great pointers and framework from Ryan Bates, see [Railscast Episode 359](http://railscasts.com/episodes/359-twitter-integration).

If you just need a widget to embed on your site, you can create a new Twitter widget [here](https://twitter.com/settings/widgets/new) by "Choosing a timeline source" and picking a user's timeline, favorites list, list, or search results. The resulting code can be dropped into any site. Include 'www.' in the Domain depending on your server set up, or just include the url with and without it. Note that these widgets allow interactions, which is cool!


Things to note:
*You'll need a PostgreSQL 'bigint' data type to store the tweet_id of each tweet. I did it through a migration, you might want to put it right into your schema and remove the migration file before running `rake db:setup`.
*Note that Twitter limits unauthenticated requests to 150/hr. You can authenticate and increase that, but for the basic search thing this app does (as of the initial commit), not sure it's really necessary. If a request is returning nothing, try this in the Rails console: `Twitter.rate_limit_status`


Resources:  
[Railscast Episode 359](http://railscasts.com/episodes/359-twitter-integration)  
[Twitter gem](https://github.com/sferik/twitter)  
[Twitter gem docs](http://rdoc.info/gems/twitter)  
[Twitter search API](https://dev.twitter.com/docs/api/1/get/search)

Requires Ruby 1.9.2 or later to run.
