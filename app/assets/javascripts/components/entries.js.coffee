@Entries = React.createClass
    getInitialState: ->
      entries: @props.data
      time: 0
      timerOn: false
      startTime: new Date
      timerText: 'Start'
      lastTime: 0
      hours: '00'
      minutes: '00'
      seconds: '00'
    render: ->
      React.DOM.div
        className: 'entries'
        React.DOM.h2
          className: 'title'
          'Entries'
        React.DOM.div
          className: 'row'
          React.createElement TimerBox, hours: @state.hours, minutes: @state.minutes, seconds: @state.seconds, timerOn: false, time: @state.time, startStopClick: this.toggleTimer, startTime: new Date, lastTime: @state.lastTime, buttonText: @state.timerText
          React.createElement AmountBox, type: 'info', amount: @amountOwed(), text: 'Amount Owed'
        React.createElement EntryForm, handleNewEntry: @addEntry
        React.DOM.hr null
        React.DOM.table
          className: 'table table-bordered table100'
          React.DOM.thead null,
            React.DOM.tr null,
              React.DOM.th null, 'Date'
              React.DOM.th null, 'Minutes'
              React.DOM.th null, 'Rate'
              React.DOM.th null, 'Total'
              React.DOM.th null, 'Invoiced'
              React.DOM.th null, 'Actions'
          React.DOM.tbody null,
            for entry in @state.entries
              React.createElement Entry, key: entry.id, entry: entry, handleDeleteEntry: @deleteEntry
    componentWillMount: ->
      @intervals = []
      
    setInterval: ->
      @intervals.push setInterval.apply(null, arguments)
    
    componentWillUnmount: ->
      @intervals.map clearInterval

    getDefaultProps: ->
      entries: []

    addEntry: (entry) ->
      entries = React.addons.update(@state.entries, { $push: [entry] })
      @setState entries: entries

    amountOwed: ->
      amounts = @state.entries.filter (val) -> val.invoiced != true
      amounts.reduce ((prev, curr) ->
        prev + parseFloat(curr.rate * (curr.minutes / 60))
      ), 0

    deleteEntry: (entry) ->
      entries = @state.entries.slice()
      index = entries.indexOf entry
      entries = React.addons.update(@state.entries, { $splice: [[index, 1]] })
      @replaceState entries: entries

    updateTimerText: (time) ->
      seconds = Math.floor(time / 1000) % 60
      minutes = Math.floor(time / (1000 * 60)) % 60
      hours = Math.floor(time / (1000 * 60 * 60)) % 24
      textSeconds = if seconds < 10 then '0' + seconds else seconds
      textMinutes = if minutes < 10 then '0' + minutes else minutes
      textHours =  if hours < 10 then '0' + hours else hours
      response = {seconds: textSeconds, minutes: textMinutes, hours: textHours, time: time}

    incrementTime: ->
      currentTime = new Date
      difference = Math.floor(currentTime.getTime() - this.state.startTime.getTime())
      time = this.state.lastTime + difference
      response = this.updateTimerText time
      this.setState(response)

    toggleTimer: (e) ->
      newTimerOn = !this.state.timerOn
      this.setState({timerOn:newTimerOn})
      e.preventDefault()
      if newTimerOn == true
        @setInterval @incrementTime, 1000
        this.setState({startTime: new Date, timerText: 'Stop'})
      else 
        this.setState({lastTime: this.state.time, timerText: 'Start'})
        @intervals.map clearInterval
