class ProjectsController < ApplicationController
  def index
    @projects = Project.all
      # render component: 'Projects', props: { data: @projects }
    end

    def create
      @project = Project.new(project_params)
      if @project.save
        render json: @project
      else
        render json: @project.errors, status: :unprocessable_entity
      end
    end

    def update
      @project = Project.find(params[:id])
      if @project.update(project_params)
        render json: @project
      else
        render json: @project.errors, status: :unprocessable_entity
      end
    end
    def destroy
      @project = Project.find(params[:id])
      @project.destroy
      head :no_content
    end

    def show
    @project = Project.find(params[:id])
    respond_to do |format|
      # format.html # index.html.erb
      format.json { render json: @project}
    end
    end

    private

    def project_params
      params.require(:project).permit(:name)
    end
  end
