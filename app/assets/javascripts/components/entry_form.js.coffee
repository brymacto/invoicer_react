@EntryForm = React.createClass
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
            placeholder: 'Date'
            name: 'date'
            value: @state.date
            onChange: @handleChange
        React.DOM.div
          className: 'form-group'
          React.DOM.input
            type: 'number'
            className: 'form-control'
            placeholder: 'Minutes'
            name: 'minutes'
            value: @state.minutes
            onChange: @handleChange
        React.DOM.div
          className: 'form-group'
          React.DOM.input
            type: 'number'
            className: 'form-control'
            placeholder: 'Rate'
            name: 'rate'
            value: @state.rate
            onChange: @handleChange
        React.DOM.button
          type: 'submit'
          className: 'btn btn-primary'
          disabled: !@valid()
          'Create entry'
    handleChange: (e) ->
      name = e.target.name
      @setState "#{ name }": e.target.value
    handleSubmit: (e) ->
      e.preventDefault()
      $.post '', { entry: @state }, (data) =>
        @props.handleNewEntry data
        @setState @getInitialState()
      , 'JSON'

    valid: ->
      @state.date && @state.minutes && @state.rate