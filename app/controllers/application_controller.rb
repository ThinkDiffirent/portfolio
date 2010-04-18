# Filters added to this controller apply to all controllers in the application.
# Likewise, all the methods added will be available for all controllers.

class ApplicationController < ActionController::Base
  helper :all # include all helpers, all the time
  protect_from_forgery # See ActionController::RequestForgeryProtection for details
  before_filter :set_locale
  
  protected
  def set_locale
    I18n.locale = params[:locale] if params[:locale].present?
  end
  
  def default_url_options(options={})
    { :locale => I18n.locale }
  end
  
  #def default_url_options(options={})
  #  debugger
  #  logger.debug "default_url_options is passed options: #{options.inspect}\n"
  #  { :locale => I18n.locale }
  #end

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
