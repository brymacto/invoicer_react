@Projects = React.createClass
  getInitialState: ->
    projects: @props.data

  getDefaultProps: ->
    projects: []

  addProject: (project) ->
    projects = React.addons.update(@state.projects, { $push: [project] })
    @setState projects: projects

  deleteProject: (project) ->
    projects = @state.projects.slice()
    index = projects.indexOf project
    projects = React.addons.update(@state.projects, { $splice: [[index, 1]] })
    @replaceState projects: projects

  render: ->
    React.DOM.div
      className: 'Projects'
      React.DOM.h2
        className: 'title'
        'Projects'
      React.createElement ProjectForm, handleNewProject: @addProject
      # React.DOM.hr null
      # React.DOM.table
      #   className: 'table table-bordered table100'
      #   React.DOM.thead null,
      #     React.DOM.tr null,
      #       React.DOM.th null, 'Name'
      #       React.DOM.th null, 'Actions'
      #   React.DOM.tbody null,
      #     for project in @state.projects
      #       React.createElement project, key: project.id, project: project, handleDeleteProject: @deleteProject