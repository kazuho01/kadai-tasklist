class TasksController < ApplicationController
  before_action :set_task, only: [:show, :edit, :update, :destroy]
  before_action :correct_user, only: [:destroy, :show, :edit, :update]

  def index
    @tasks = Task.all.page(params[:page]).per(30)
  end

  def show
  end
  
  def new
    @task = Task.new
  end
  
  def create
    @task = current_user.tasks.build(task_params)
    
    if @task.save
      flash[:success] = "タスクの投稿に成功しました"
      redirect_to root_url
    else
      flash.now[:danger] = "タスクの投稿に失敗しました"
      render "toppages/index"
    end
  end
  
  def edit
  end
  
  def update
    if @task.update(task_params)
      flash[:success] = "タスクの投稿に成功しました"
      redirect_to @task
    else
      flash.now[:danger] = "タスクの投稿に失敗しました"
      render :edit
    end
  end
  
  def destroy
    @task.destroy
    
    flash[:success] = "タスクは正常に削除されました"
    redirect_back(fallback_location: root_path)
  end

  private

  #Strong Parameter
  
  def set_task
    @task = Task.find(params[:id])
  end

  def task_params
    params.require(:task).permit(:content, :status)
  end
  
  def correct_user
    @task = current_user.tasks.find_by(id: params[:id])
    unless @task
      redirect_to root_url
    end
  end
  
end
