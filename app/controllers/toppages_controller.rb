class ToppagesController < ApplicationController
  def index
    if logged_in?
      @task = current_user.tasks.build # form_for 用
      @tasks = current_user.tasks.order("created_at desc").page(params[:page])
    end
  end
end
