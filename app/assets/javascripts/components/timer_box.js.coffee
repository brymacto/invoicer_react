@TimerBox = React.createClass
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
              '00'
            ':'
            React.DOM.span 
              id: 'timer-minutes'
              '00'
            ':'
            React.DOM.span 
              id: 'timer-seconds'
              '00'
          React.DOM.a
            id: 'start-stop'
            href: '#'
            onClick: @toggleTimer
            'Start'

  toggleTimer: (e) ->
    e.preventDefault()
    timer = undefined
    timerOn = false
    time = 0
    hours = undefined
    minutes = undefined
    seconds = undefined
    difference = 0
    startTime = undefined
    lastTime = 0
    startTimer = ->
      startTime = new Date
      timer = setInterval(addTime, 1000)
      return
    stopTimer = ->
      clearInterval timer
      lastTime = time
      return
    addTime = ->
      currentTime = new Date
      difference = Math.floor(currentTime.getTime() - startTime.getTime())
      time = lastTime + difference
      updateTimerText time
      return
    updateTimerText = (time) ->
      seconds = Math.floor(time / 1000) % 60
      minutes = Math.floor(time / (1000 * 60)) % 60
      hours = Math.floor(time / (1000 * 60 * 60)) % 24
      $('#timer-seconds').text if seconds < 10 then '0' + seconds else seconds
      $('#timer-minutes').text if minutes < 10 then '0' + minutes else minutes
      $('#timer-hours').text if hours < 10 then '0' + hours else hours
      return
    $('#start_stop').click ->
      timerOn = !timerOn
      if timerOn
        $(this).text 'Stop'
        startTimer()
      else
        $(this).text 'Start'
        stopTimer()
      return
    return

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
