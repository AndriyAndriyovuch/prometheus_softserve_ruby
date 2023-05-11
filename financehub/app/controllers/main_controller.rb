class MainController < ApplicationController
  def index
      @operations = Operation.where('user_id = ? AND income = ?', current_user.id, false)
                             .order(:odate).last(10).reverse if user_signed_in?
  end
end
