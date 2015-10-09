@Task = React.createClass
  handleDelete: (e) ->
    e.preventDefault()
    $.ajax
      method: 'DELETE'
      url: "/tasks/#{ @props.task.id }"
      dataType: 'JSON'
      success: () =>
        @props.handleDeleteTask @props.task


  render: ->
    React.DOM.tr null,
      React.DOM.td null, @props.task.name
      React.DOM.td null,
        React.DOM.a
          className: 'btn btn-danger'
          onClick: @handleDelete
          'Delete'
