class TasksController < ApplicationController


	def index
  		@tasks = Task.all
  	end

	def show
  		@task = Task.find(params[:id])
  	end
	
	def new	
		@task = Task.new
	end

	def create
  	@task = Task.new(task_params)

  	if @task.save
  	redirect_to root_url
  else 
    redirect_to root_url
  end
end


	private
  def task_params
    params.require(:tasks).permit(:name, :status, :project_id)
  end

end
