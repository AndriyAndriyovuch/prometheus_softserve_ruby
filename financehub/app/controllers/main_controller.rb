require 'open-uri'

class MainController < ApplicationController
  def index
    @operations = Operation.where('user_id = ?', current_user.id).order(:odate).last(10).reverse
    puts('-' * 50)
    puts @operations
    puts('-' * 50)

  end
end
