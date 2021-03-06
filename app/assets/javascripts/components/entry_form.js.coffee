@EntryForm = React.createClass
    getInitialState: ->
      title: ''
      date: ''
      amount: ''
      formTime: @props.time
      minutes: null
      rate: ''
      notes: ''
      project_id: null
      task_id: null
      
    render: ->
      React.DOM.form
        className: 'form-inline'
        onSubmit: @handleSubmit
        React.DOM.div
          className: 'row'
          React.DOM.div
            className: 'form-group columns small-12 large-4'
            React.createElement SelectBox, options: getSelectOptions(@props.projects), onChange: @handleChange, ref: 'projects_options', defaultValue: ''
        React.DOM.div
          className: 'row'
          React.DOM.div
            className: 'form-group columns small-12 large-4'
            React.DOM.input
              type: 'text'
              className: 'form-control'
              placeholder: 'Date*'
              name: 'date'
              value: @state.date
              onChange: @handleChange
          React.DOM.div
            className: 'form-group columns small-12 large-4'
            React.DOM.input
              type: 'number'
              className: 'form-control'
              placeholder: 'Minutes*'
              name: 'minutes'
              ref: 'minutes'
              value: @state.minutes
              onChange: @handleChange
          React.DOM.div
            className: 'form-group columns small-12 large-4'
            React.DOM.input
              type: 'number'
              className: 'form-control'
              placeholder: 'Rate*'
              name: 'rate'
              value: @state.rate
              onChange: @handleChange
        React.DOM.div
          className: 'row'
          React.DOM.div
            className: 'form-group columns small-12 large-12'
            React.DOM.textarea
              type: 'text'
              className: 'form-control'
              placeholder: 'Notes'
              name: 'notes'
              value: @state.notes
              onChange: @handleChange
        React.DOM.div
          className: 'row'
          React.DOM.div
            className: 'form-group columns small-4 large-4'
            React.DOM.label
              # for: 'invoiced'
              className: 'form-label'
              'Invoiced?'
            React.DOM.input
              type: 'checkbox'
              className: 'form-control columns small-12 large-12 form-check'
              name: 'invoiced'
              value: @state.invoiced
              onChange: @handleChange
          React.DOM.div
            className: 'form-group columns small-4 large-4'
            React.DOM.a
              id: 'use-time'
              className: 'button secondary columns small-12 large-12'
              href: '#'
              onClick: @importTimer
              'Import from timer'
          React.DOM.div
            className: 'form-group columns small-4 large-4'
            React.DOM.button
              type: 'submit'
              className: 'btn btn-primary columns small-12 large-12'
              disabled: !@valid()
              'Create entry'
    handleChange: (e) ->
      name = e.target.name
      @setState "#{ name }": e.target.value
    logChange: (val) ->
      console.log 'selected: ' + val
    handleSubmit: (e) ->
      e.preventDefault()
      $.post '/entries', { entry: @state }, (data) =>
        @props.handleNewEntry data
        @setState @getInitialState()
      , 'JSON'
    importTimer: (e) ->
      e.preventDefault()
      minutes = Math.floor(@props.time / 1000 / 60)
      this.setState({minutes: minutes})
    valid: ->
      @state.date && @state.minutes && @state.rate
    getSelectOptions = (projects) ->
      select_projects = []
      $.each projects, (index, project) ->
        select_projects.push {value: project.id, label: project.name}
        return null
      return select_projects