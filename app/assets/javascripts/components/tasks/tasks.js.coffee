@Tasks = React.createClass
  getInitialState: ->
    tasks: @props.data

  getDefaultProps: ->
    tasks: []

  addTask: (task) ->
    tasks = React.addons.update(@state.tasks, { $push: [task] })
    @setState tasks: tasks

  deleteTask: (task) ->
    tasks = @state.tasks.slice()
    index = tasks.indexOf task
    tasks = React.addons.update(@state.tasks, { $splice: [[index, 1]] })
    @replaceState tasks: tasks

  render: ->
    React.DOM.div
      className: 'Tasks'
      React.DOM.h2
        className: 'title'
        'Tasks'
      React.createElement TaskForm, handleNewTask: @addTask
      React.DOM.hr null
      React.DOM.table
        className: 'table table-bordered table100'
        React.DOM.thead null,
          React.DOM.tr null,
            React.DOM.th null, 'Name'
            React.DOM.th null, 'Actions'
        React.DOM.tbody null,
          for task in @state.tasks
            React.createElement Task, key: task.id, task: task, handleDeleteTask: @deleteTask, handleEditTask: @updateTask
