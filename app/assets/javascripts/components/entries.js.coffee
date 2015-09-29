  @Entries = React.createClass
    getInitialState: ->
      entries: @props.data
      
    getDefaultProps: ->
      entries: []

    render: ->
      React.DOM.div
        className: 'entries'
        React.DOM.h2
          className: 'title'
          'Entries'