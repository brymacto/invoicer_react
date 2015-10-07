@EntryForm = React.createClass
    getInitialState: ->
      title: ''
      date: ''
      amount: ''
      formTime: @props.time
      # minutes: null
    render: ->
      React.DOM.form
        className: 'form-inline'
        onSubmit: @handleSubmit
        React.DOM.div
          className: 'row'
          React.DOM.div
            className: 'form-group columns small-12 large-4'
            React.DOM.input
              type: 'text'
              className: 'form-control'
              placeholder: 'Date'
              name: 'date'
              value: @state.date
              onChange: @handleChange
          React.DOM.div
            className: 'form-group columns small-12 large-4'
            React.DOM.input
              type: 'number'
              className: 'form-control'
              placeholder: 'Minutes'
              name: 'minutes'
              ref: 'minutes'
              value: @state.minutes
              onChange: @handleChange
          React.DOM.div
            className: 'form-group columns small-12 large-4'
            React.DOM.input
              type: 'number'
              className: 'form-control'
              placeholder: 'Rate'
              name: 'rate'
              value: @state.rate
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
    handleSubmit: (e) ->
      e.preventDefault()
      $.post '/entries', { entry: @state }, (data) =>
        @props.handleNewEntry data
        @setState @getInitialState()
      , 'JSON'
    importTimer: (e) ->
      e.preventDefault()
      minutes = Math.floor(@props.time / 1000 / 60)
      console.log(minutes)
      # console.log 'clicked'
      # this.refs.minutes.getDOMNode().value = '60'
      # this.setState({minutes: this.refs.minutes.getDOMNode().value})
      # this.setState({minutes: this.state.time})


    valid: ->
      @state.date && @state.minutes && @state.rate