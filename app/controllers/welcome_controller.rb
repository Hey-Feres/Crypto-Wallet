class WelcomeController < ApplicationController
  def index
  	cookies[:curso] = "Sou um cookie"
  	session[:curso] = "Sou uma Session"
  	@nome = 'Bruno'
  end
end
