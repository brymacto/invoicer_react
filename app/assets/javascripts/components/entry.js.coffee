@Entry = React.createClass
  render: ->
    React.DOM.tr null,
      React.DOM.td null, @props.entry.date
      React.DOM.td null, @props.entry.minutes
      React.DOM.td null, @props.entry.rate
      React.DOM.td null, @props.entry.rate * (@props.entry.minutes / 60)
      React.DOM.td null, if @props.entry.invoiced == true then 'true' else ''
