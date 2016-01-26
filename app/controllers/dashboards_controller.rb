class DashboardsController < ApplicationController
  before_filter :require_login
  
  def show
    @questions = current_user.questions
  end
end