@Entry = React.createClass
  getInitialState: ->
    edit: false
    invoiced: @props.entry.invoiced
    projectName: ''
    project_id: @props.entry.project_id
    projects: @props.projects
    project_fail: false
  componentDidMount: ->
    @_fetchProjectName({}, 'projects', @props.entry.project_id)
  componentDidUpdate: ->
    @_fetchProjectName({}, 'projects', @props.entry.project_id)
  _fetchProjectName: (data, model, id)->
    # if (@state.project_fail != true)
    # if (@state.project_fail != true) && ((@props.entry.project_id != null) && (@props.entry.project_id != ''))
      # @setState
      #   project_fail: false
    if @props.entry.project_id != null
      $.ajax
        url: '/' + model + '/' + id
        dataType: 'json'
        format: 'json'
        data: data
      .done @_fetchDataDone
      .fail @_fetchDataFail
    else
      if @state.projectName != 'None'
        @setState
          projectName: 'None'
      # Commented this out as it's causing infinite loop with componentDidUpdate
  _fetchDataDone: (data, textStatus, jqXHR) ->
    if @state.projectName != data.name
      @setState
        projectName: data.name
        # project_id: @props.entry.project_id
  _fetchDataFail: (xhr, status, err) ->
    @setState
      projectName: '*deleted project'
      project_fail: true
    console.error '', status, err.toString()
  handleDelete: (e) ->
    e.preventDefault()
    $.ajax
      method: 'DELETE'
      url: "/entries/#{ @props.entry.id }"
      dataType: 'JSON'
      success: () =>
        @props.handleDeleteEntry @props.entry
  handleToggle: (e) ->
    e.preventDefault()
    @setState edit: !@state.edit
  handleEdit: (e) ->
      e.preventDefault()
      data =
        date: React.findDOMNode(@refs.date).value
        minutes: React.findDOMNode(@refs.minutes).value
        rate: React.findDOMNode(@refs.rate).value
        notes: React.findDOMNode(@refs.notes).value
        invoiced: React.findDOMNode(@refs.invoiced).checked
        project_id: @getProjectId(React.findDOMNode(@refs.projects_options_edit).value)
        # project_id: parseInt(React.findDOMNode(@refs.projects_options_edit).value, 10)
      $.ajax
        method: 'PUT'
        url: "/entries/#{ @props.entry.id }"
        dataType: 'JSON'
        data:
          entry: data
        success: (data) =>
          @setState edit: false
          @props.handleEditEntry @props.entry, data
  getProjectId: (value) ->
    if value == ''
      return null
    else
      parseInt(value, 10)
  handleChange: (e) ->
    # console.log(e)
  render: ->
    if @state.edit
      @entryForm()
    else
      @entryRow()

  entryRow: ->
    React.DOM.tr null,
      React.DOM.td null, @props.entry.date
      React.DOM.td null, @props.entry.minutes
      React.DOM.td null, amountFormat(@props.entry.rate)
      React.DOM.td null, amountFormat(@props.entry.rate * (@props.entry.minutes / 60))
      React.DOM.td null, if @props.entry.invoiced == true then 'true' else ''
      React.DOM.td null, @state.projectName
      React.DOM.td null, truncString(@props.entry.notes)
      React.DOM.td null,
        React.DOM.a
          className: 'button tiny form-button'
          onClick: @handleDelete
          'Delete'
        React.DOM.a
          className: 'button tiny form-button'
          onClick: @handleToggle
          'Edit'

  entryForm: ->
    React.DOM.tr null,
      React.DOM.td null,
        React.DOM.input
          className: 'form-control'
          type: 'text'
          defaultValue: @props.entry.date
          ref: 'date'
      React.DOM.td null,
        React.DOM.input
          className: 'form-control'
          type: 'text'
          defaultValue: @props.entry.minutes
          ref: 'minutes'
      React.DOM.td null,
        React.DOM.input
          className: 'form-control'
          type: 'number'
          defaultValue: @props.entry.rate
          ref: 'rate'
      React.DOM.td null, amountFormat(@props.entry.rate * (@props.entry.minutes / 60))
      React.DOM.td null,
        React.DOM.input
          className: 'form-control'
          type: 'checkbox'
          initialChecked: @state.invoiced || @props.entry.invoiced
          defaultChecked: @state.invoiced || @props.entry.invoiced
          ref: 'invoiced'
      React.DOM.td null, 
        React.createElement SelectBox, options: getSelectOptions(@state.projects), onChange: @handleChange, ref: 'projects_options_edit', defaultValue: @props.entry.project_id
      React.DOM.td null,
        React.DOM.textarea
            className: 'form-control'
            type: 'text'
            defaultValue: @props.entry.notes
            ref: 'notes'
      React.DOM.td null,
        React.DOM.a
          className: 'button success tiny form-button'
          onClick: @handleEdit
          'Update'
        React.DOM.a
          className: 'button alert tiny form-button'
          onClick: @handleToggle
          'Cancel'

  getSelectOptions = (projects) ->
    select_projects = []
    $.each projects, (index, project) ->
      select_projects.push {value: project.id, label: project.name}
      return null
    return select_projects

