desc "This task is called by the Heroku scheduler add-on"
task :scheduler_test => :environment do
    puts "running a scheduled test..."
    puts "done."
end

task :fetch => :environment do
    puts "Fetching new Tweets"
    Tweet.pull_tweets
    puts "done."
end
