@Records = React.createClass
  getInitialState: ->
    records: @props.data

  getDefaultProps: ->
    records: []

  addRecord: (record) ->
    records = @state.records.slice()
    records.push(record)
    @setState records: records

  deleteRecord: (record) ->
    records = @state.records.slice()
    index = records.indexOf(record)
    records.splice(index, 1)
    @replaceState records: records  

  editRecord: (record, data) ->
    records = @state.records.slice() # copy
    index = records.indexOf(record)
    if index
      records[index] = data
      @replaceState records: records

  credits: ->
    credits = @state.records.filter (val) -> val.amount >= 0
    credits.reduce ((prev, curr) ->
        prev + parseFloat(curr.amount)
      ), 0

  debits: ->
    debits = @state.records.filter (val) -> val.amount < 0
    debits.reduce ((prev, curr) ->
      prev + parseFloat(curr.amount)
    ), 0

  balance: ->
    @debits() + @credits()

  handleSearch: (data) ->
    @replaceState records: data

  render: ->
    React.DOM.div
      className: 'records'
      React.DOM.div
        className: 'row'
        React.DOM.div
          className: 'col-md-3'
          React.DOM.h2
            className: 'title'
            'Records'
        React.DOM.div
          className: 'col-md-9'
          React.createElement RecordSearch, handleSearch: @handleSearch

      React.DOM.div
        className: 'row'
        React.createElement AmountBox, amount: @credits(), name: 'Credit', type: 'info'
        React.createElement AmountBox, amount: @debits(), name: 'Debit', type: 'warning'
        React.createElement AmountBox, amount: @balance(), name: 'Balance', type: 'success'
      React.createElement RecordForm, handleNewRecord: @addRecord
      React.DOM.hr
      React.DOM.table
        className: 'table table-bordered'
        React.DOM.thead null,
          React.DOM.tr
            className: 'info'
            React.DOM.td null, "Date"
            React.DOM.td null, "Name"
            React.DOM.td null, "Amount"
            React.DOM.td null, "Actions"
        React.DOM.tbody null,
          for record in @state.records
            React.createElement Record, key: record.id, record: record, handleDeleteRecord: @deleteRecord, handleEditRecord: @editRecord
      
      
      