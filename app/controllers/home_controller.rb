class HomeController < ApplicationController
  def index
    token = cookies[:token]
    if token.nil?
      render 'login/signin'
    else
      render 'index'
    end
  end
end
