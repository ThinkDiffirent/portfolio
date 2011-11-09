class PagesController < ApplicationController
  rescue_from ActionView::MissingTemplate do |e|
    render :file => 'public/404.html', :status => 404, :layout => false if Rails.env.production?
  end

  def method_missing(*args)
    expires_in 3.hours, :public => true
    render :action => params[:action]
  end
end
