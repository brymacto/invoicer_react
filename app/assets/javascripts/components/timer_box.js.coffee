@TimerBox = React.createClass
  getInitialState: ->
    {hours: @props.hours, minutes: @props.minutes, seconds: @props.seconds, timerOn: @props.timerOn, startTime: new Date, time: 0, lastTime: 0, buttonText: 'Start'}
  
  componentWillMount: ->
    @intervals = []
    return
    
  setInterval: ->
    @intervals.push setInterval.apply(null, arguments)
    return
  
  componentWillUnmount: ->
    @intervals.map clearInterval
    return
  
  render: ->
    React.DOM.div
      className: 'small-4 large-4 columns'
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
          React.DOM.a
            id: 'start-stop'
            href: '#'
            onClick: @toggleTimer
            this.state.buttonText

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

  addTime: ->
    currentTime = new Date
    difference = Math.floor(currentTime.getTime() - this.state.startTime.getTime())
    time = this.state.lastTime + difference
    response = updateTimerText time
    this.setState(response)
    return

  updateTimerText = (time) ->
      seconds = Math.floor(time / 1000) % 60
      minutes = Math.floor(time / (1000 * 60)) % 60
      hours = Math.floor(time / (1000 * 60 * 60)) % 24
      textSeconds = if seconds < 10 then '0' + seconds else seconds
      textMinutes = if minutes < 10 then '0' + minutes else minutes
      textHours =  if hours < 10 then '0' + hours else hours
      response = {seconds: textSeconds, minutes: textMinutes, hours: textHours, time: time}
      return response

