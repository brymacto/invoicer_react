@TimerBox = React.createClass
  getInitialState: ->
    {hours: @props.hours, minutes: @props.minutes, seconds: @props.seconds, timerOn: @props.timerOn}
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
            'Start'
  # componentDidMount: ->
  #   @setInterval @addTime, 1000
  #   # Call a method on the mixin
  #   return

  toggleTimer: (e) ->
    console.log "state"
    console.log this.state.timerOn
    this.setState({timerOn:true})
    console.log "state"
    console.log this.state.timerOn
    e.preventDefault()
    if this.state.timerOn == true
      @setInterval @addTime, 1000
    else 
      @intervals.map clearInterval

    # this.setState({seconds: '10'})
    # this.setInterval()

  addTime: ->
    console.log 'time'

  componentWillMount: ->
    @intervals = []
    return
  setInterval: ->
    @intervals.push setInterval.apply(null, arguments)
    return
  componentWillUnmount: ->
    @intervals.map clearInterval
    return

    # timer = undefined
    # timerOn = false
    # time = 0
    # hours = undefined
    # minutes = undefined
    # seconds = undefined
    # difference = 0
    # startTime = undefined
    # lastTime = 0
    # startTimer = ->
    #   startTime = new Date
    #   this.setInterval(addTime, 1000)
    #   return
    # stopTimer = ->
    #   clearInterval timer
    #   lastTime = time
    #   return
    # addTime = ->
    #   currentTime = new Date
    #   difference = Math.floor(currentTime.getTime() - startTime.getTime())
    #   time = lastTime + difference
    #   updateTimerText time
    #   return
    # updateTimerText = (time) ->
    #   seconds = Math.floor(time / 1000) % 60
    #   minutes = Math.floor(time / (1000 * 60)) % 60
    #   hours = Math.floor(time / (1000 * 60 * 60)) % 24
    #   textSeconds = if seconds < 10 then '0' + seconds else seconds
    #   textMinutes = if minutes < 10 then '0' + minutes else minutes
    #   textHours =  if hours < 10 then '0' + hours else hours
    #   this.setState({seconds: textSeconds, minutes: textMinutes, hours: textHours})
    #   return
    # $('#start_stop').click ->
    #   timerOn = !timerOn
    #   if timerOn
    #     $(this).text 'Stop'
    #     startTimer()
    #   else
    #     $(this).text 'Start'
    #     stopTimer()
    #   return
    # return





    # '<div class="small-4 large-4 columns">
    #   <div class="panel">
    #     <div class="panel-heading"> Timer </div>
    #     <div class="panel-body">
    #       <div class="timer">
    #         <span id="timer-hours"> 00 </span> : <span id="timer-minutes"> 00 </span> : <span id="timer-seconds"> 00 </span>
    #     </div>
    #     </div>    
    #   </div>
    # </div>'
