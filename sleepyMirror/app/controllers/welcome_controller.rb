class WelcomeController < ApplicationController
  def index
    puts "hi there"
  end

  def hi
    puts "this is me"

    render json: []
  end
end
