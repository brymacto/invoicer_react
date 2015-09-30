  @Entries = React.createClass
    getInitialState: ->
      entries: @props.data

    getDefaultProps: ->
      entries: []

    addEntry: (entry) ->
      entries = @state.entries.slice()
      entries.push entry
      @setState entries: entries

    render: ->
      React.DOM.div
        className: 'entries'
        React.DOM.h2
          className: 'title'
          'Entries'
        React.createElement EntryForm, handleNewEntry: @addEntry
        React.DOM.hr null
        React.DOM.table
          className: 'table table-bordered'
          React.DOM.thead null,
            React.DOM.tr null,
              React.DOM.th null, 'Date'
              React.DOM.th null, 'Amount'
              React.DOM.th null, 'Rate'
          React.DOM.tbody null,
            for entry in @state.entries
              React.createElement Entry, key: entry.id, entry: entry