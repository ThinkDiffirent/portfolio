# Filters added to this controller apply to all controllers in the application.
# Likewise, all the methods added will be available for all controllers.

class ApplicationController < ActionController::Base
  helper :all # include all helpers, all the time
  protect_from_forgery # See ActionController::RequestForgeryProtection for details

  # Scrub sensitive parameters from your log
  # filter_parameter_logging :password
  # before_filter :load_tweets
  
  # protected
  # TODO : caches tweets...
  # def load_tweets
  #  if File.exists?(LAST_TWEETS_FILE)
  #    @tweets = YAML.load_file(LAST_TWEETS_FILE)
  #  end
  # end
end
