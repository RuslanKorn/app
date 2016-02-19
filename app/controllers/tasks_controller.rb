class TasksController < ApplicationController

	def index
  		@task = Task.all
  end

	def show
  		@task = Task.find(params[:id])
  end
	
	def new	
		@task = Task.new
	end

	def create
  	@task = Task.new(project_params)
    if @task.save
      flash[:success] = "Task Add!"
      redirect_to tasks_url
  end
end


	private
  def task_params
    params.require(:task).permit(:name, :status)
  end

end
