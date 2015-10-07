@Entry = React.createClass
  getInitialState: ->
    edit: false
    invoiced: @props.entry.invoiced
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
        invoiced: React.findDOMNode(@refs.invoiced).checked
      $.ajax
        method: 'PUT'
        url: "/entries/#{ @props.entry.id }"
        dataType: 'JSON'
        data:
          entry: data
        success: (data) =>
          @setState edit: false
          @props.handleEditEntry @props.entry, data

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
        React.DOM.input
          className: 'form-control'
          type: 'checkbox'
          initialChecked: @state.invoiced || @props.entry.invoiced
          # onChange: this.onChange
          defaultChecked: @state.invoiced || @props.entry.invoiced
          ref: 'invoiced'
      React.DOM.td null,
        React.DOM.a
          className: 'button success tiny form-button'
          onClick: @handleEdit
          'Update'
        React.DOM.a
          className: 'button alert tiny form-button'
          onClick: @handleToggle
          'Cancel'