class DashboardsController < ApplicationController
  def show
    @questions = current_user.questions
  end
end