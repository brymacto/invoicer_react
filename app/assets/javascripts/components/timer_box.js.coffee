@TimerBox = React.createClass
  getInitialState: ->
    {}
  
  componentWillMount: ->
    @intervals = []
    
  setInterval: ->
    @intervals.push setInterval.apply(null, arguments)
  
  componentWillUnmount: ->
    @intervals.map clearInterval
  
  render: ->
    React.DOM.div
      className: 'small-12 large-4 columns'
      React.DOM.div
        className: "panel"
        React.DOM.div
          className: 'panel-heading'
          'Timer'
        React.DOM.div
          className: 'panel-body'
          React.DOM.div
            className: 'timer'
            React.DOM.span 
              id: 'timer-hours'
              @props.hours
            ':'
            React.DOM.span 
              id: 'timer-minutes'
              @props.minutes
            ':'
            React.DOM.span 
              id: 'timer-seconds'
              @props.seconds
          React.DOM.div
            className: 'timer-buttons'
            React.DOM.a
              id: 'start-stop'
              className: 'button tiny'
              href: '#'
              onClick: @props.startStopClick
              @props.buttonText
            React.DOM.a
              id: 'reset'
              className: 'button tiny secondary'
              href: '#'
              onClick: @props.resetClick
              'Reset'


