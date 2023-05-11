class MainController < ApplicationController
  def index
    return unless user_signed_in?

    @operations = Operation.where(user_id: current_user, income: false).order(:odate).last(10).reverse
  end
end
