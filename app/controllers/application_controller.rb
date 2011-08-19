class ApplicationController < ActionController::Base
  protect_from_forgery
  
  before_filter :set_locale
  
  protected
  def set_locale
    redirect_to "http://www.nicolasblanco.fr", :status => :moved_permanently if Rails.env.production? && request.subdomain != "www"
    
    I18n.locale = params[:locale] if params[:locale].present?
  end
  
  def default_url_options(options={})
    { :locale => I18n.locale }
  end
end

