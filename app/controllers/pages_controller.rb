class PagesController < ApplicationController
  def method_missing(*args)
    render :action => params[:action]
  end
end

