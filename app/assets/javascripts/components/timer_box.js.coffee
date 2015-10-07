@TimerBox = React.createClass
  getInitialState: ->
    {hours: @props.hours, minutes: @props.minutes, seconds: @props.seconds, timerOn: @props.timerOn, startTime: new Date, time: @props.time, lastTime: 0, buttonText: 'Start'}
  
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
              this.state.hours
            ':'
            React.DOM.span 
              id: 'timer-minutes'
              this.state.minutes
            ':'
            React.DOM.span 
              id: 'timer-seconds'
              this.state.seconds
          React.DOM.div
            className: 'timer-buttons'
            React.DOM.a
              id: 'start-stop'
              className: 'button tiny'
              href: '#'
              onClick: @props.startStopClick
              this.state.buttonText
            React.DOM.a
              id: 'reset'
              className: 'button tiny secondary'
              href: '#'
              onClick: @resetTimer
              'Reset'
            # React.DOM.a
            #   id: 'use-time'
            #   className: 'button tiny secondary'
            #   href: '#'
            #   onClick: @resetTimer
            #   'Use time'

  toggleTimer: (e) ->
    newTimerOn = !this.state.timerOn
    this.setState({timerOn:newTimerOn})
    e.preventDefault()
    if newTimerOn == true
      @setInterval @addTime, 1000
      this.setState({startTime: new Date, buttonText: 'Stop'})
    else 
      this.setState({lastTime: this.state.time, buttonText: 'Start'})
      @intervals.map clearInterval

  resetTimer: (e) ->
    this.setState({timerOn:false,buttonText:'Start',time:0, lastTime:0, hours:'00', minutes:'00', seconds:'00'})
    @intervals.map clearInterval

  addTime: ->
    currentTime = new Date
    difference = Math.floor(currentTime.getTime() - this.state.startTime.getTime())
    time = this.state.lastTime + difference
    response = updateTimerText time
    this.setState(response)

  updateTimerText = (time) ->
      seconds = Math.floor(time / 1000) % 60
      minutes = Math.floor(time / (1000 * 60)) % 60
      hours = Math.floor(time / (1000 * 60 * 60)) % 24
      textSeconds = if seconds < 10 then '0' + seconds else seconds
      textMinutes = if minutes < 10 then '0' + minutes else minutes
      textHours =  if hours < 10 then '0' + hours else hours
      response = {seconds: textSeconds, minutes: textMinutes, hours: textHours, time: time}

