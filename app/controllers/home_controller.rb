class HomeController < ApplicationController
  layout :load_layout
  
  def index
    @title = "Welcome"
  end

  #private
  def load_layout
    if current_user.nil?
      "login"
    else
      "application"
    end
  end
end
