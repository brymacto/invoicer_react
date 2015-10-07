@AmountBox = React.createClass
  render: ->
    React.DOM.div
      className: 'small-12 large-4 columns'
      React.DOM.div
        className: "panel"
        React.DOM.div
          className: 'panel-heading'
          @props.text
        React.DOM.div
          className: 'panel-body'
          amountFormat(@props.amount)

