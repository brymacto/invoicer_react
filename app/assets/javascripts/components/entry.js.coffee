@Entry = React.createClass
  render: ->
    React.DOM.tr null,
      React.DOM.td null, @props.entry.date
      React.DOM.td null, @props.entry.amount
      React.DOM.td null, @props.entry.rate
