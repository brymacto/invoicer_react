@Entry = React.createClass
  handleDelete: (e) ->
    e.preventDefault()
    $.ajax
      method: 'DELETE'
      url: "/entries/#{ @props.entry.id }"
      dataType: 'JSON'
      success: () =>
        @props.handleDeleteEntry @props.entry


  render: ->
    React.DOM.tr null,
      React.DOM.td null, @props.entry.date
      React.DOM.td null, @props.entry.minutes
      React.DOM.td null, @props.entry.rate
      React.DOM.td null, @props.entry.rate * (@props.entry.minutes / 60)
      React.DOM.td null, if @props.entry.invoiced == true then 'true' else ''
      React.DOM.td null,
        React.DOM.a
          className: 'btn btn-danger'
          onClick: @handleDelete
          'Delete'
