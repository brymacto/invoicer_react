  @Entries = React.createClass
    getInitialState: ->
      entries: @props.data

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

    render: ->
      React.DOM.div
        className: 'entries'
        React.DOM.h2
          className: 'title'
          'Entries'
        React.DOM.div
          className: 'row'
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