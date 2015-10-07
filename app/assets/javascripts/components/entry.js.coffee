@Entry = React.createClass
  getInitialState: ->
    edit: false
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

  render: ->
    if @state.edit
      @entryForm()
    else
      @entryRow()

  entryRow: ->
    React.DOM.tr null,
      React.DOM.td null, @props.entry.date
      React.DOM.td null, @props.entry.minutes
      React.DOM.td null, @props.entry.rate
      React.DOM.td null, @props.entry.rate * (@props.entry.minutes / 60)
      React.DOM.td null, if @props.entry.invoiced == true then 'true' else ''
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
      React.DOM.td null, @props.entry.rate * (@props.entry.minutes / 60)
      React.DOM.td null,
        'Invoiced'
      React.DOM.td null,
        React.DOM.a
          className: 'button success tiny form-button'
          onClick: @handleEdit
          'Update'
        React.DOM.a
          className: 'button alert tiny form-button'
          onClick: @handleToggle
          'Cancel'