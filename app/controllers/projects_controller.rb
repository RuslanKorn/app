class ProjectsController < ApplicationController

  def index
  	@project = Project.all
  end

  def show
  	@project = Project.find(params[:id])
  end

  def new
    @project = Project.new
  end

  def edit
    @project = Project.find(params[:id])
  end

  def create
  	@project = Project.new(project_params)

  	if @project.save
  	redirect_to resources :tasks
  else 
    redirect_to @project
  end
end

  def update
    @project = Project.find(params[:id])
 
    if @project.update(project_params)
      redirect_to root_url
  else
    render 'edit'
  end
  end

  def destroy
    @project = Project.find(params[:id])
    @project.destroy
    
    redirect_to root_url
  end

  private
  def project_params
    params.require(:projects).permit(:name, :text)
  end

end
