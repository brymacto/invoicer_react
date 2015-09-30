  @Entries = React.createClass
    getInitialState: ->
      entries: @props.data

    getDefaultProps: ->
      entries: []

    addEntry: (entry) ->
      entries = @state.entries.slice()
      entries.push entry
      @setState entries: entries

    amountOwed: ->
      amounts = @state.entries.filter (val) -> val.invoiced != true
      amounts.reduce ((prev, curr) ->
        prev + parseFloat(curr.rate * (curr.minutes / 60))
      ), 0

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
          className: 'table table-bordered'
          React.DOM.thead null,
            React.DOM.tr null,
              React.DOM.th null, 'Date'
              React.DOM.th null, 'Minutes'
              React.DOM.th null, 'Rate'
              React.DOM.th null, 'Total'
              React.DOM.th null, 'Invoiced'
          React.DOM.tbody null,
            for entry in @state.entries
              React.createElement Entry, key: entry.id, entry: entry