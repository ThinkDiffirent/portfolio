namespace :twitter do
  desc "Get all the latest tweets and store them in the YAML file"
  task :get => :environment do
    twitter_client = Twitter::Base.new(Twitter::HTTPAuth.new(SystemSetting[:twitter_username], SystemSetting[:twitter_password])) # authenticate with Twitter using HTTP auth
    File.open(LAST_TWEETS_FILE, "w") { |f| f.write(twitter_client.user_timeline[0..3].to_yaml) }
  end
end