@ProjectForm = React.createClass
    getInitialState: ->
      title: ''
      date: ''
      amount: ''
    render: ->
      React.DOM.form
        className: 'form-inline'
        onSubmit: @handleSubmit
        React.DOM.div
          className: 'form-group'
          React.DOM.input
            type: 'text'
            className: 'form-control'
            placeholder: 'Name'
            name: 'name'
            value: @state.name
            onChange: @handleChange
        React.DOM.button
          type: 'submit'
          className: 'btn btn-primary'
          disabled: !@valid()
          'Create project'
    handleChange: (e) ->
      name = e.target.name
      @setState "#{ name }": e.target.value
    handleSubmit: (e) ->
      e.preventDefault()
      $.post '/projects', { project: @state }, (data) =>
        @props.handleNewProject data
        @setState @getInitialState()
      , 'JSON'

    valid: ->
      @state.name