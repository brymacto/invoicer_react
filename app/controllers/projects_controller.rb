class ProjectsController < ApplicationController
    def index
      @projects = Project.all
      # render component: 'Projects', props: { data: @projects }
    end
end
