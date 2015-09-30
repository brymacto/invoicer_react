@AmountBox = React.createClass
  render: ->
    React.DOM.div
      className: 'col-md-12'
      React.DOM.div
        className: "panel panel-#{ @props.type }"
        React.DOM.div
          className: 'panel-heading'
          @props.text
        React.DOM.div
          className: 'panel-body'
          amountFormat(@props.amount)

