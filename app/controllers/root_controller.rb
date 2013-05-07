class RootController < ApplicationController

  def index
    if session[:register_as_member]
      session[:register_as_member] = false
      redirect_to '/profile'
    end
  end

end
