require 'open-uri'

class MainController < ApplicationController
  def index
    @operations = Operation.where('user_id = ? AND income = ?', current_user.id, false)
                  .order(:odate).last(10).reverse
  end
end
