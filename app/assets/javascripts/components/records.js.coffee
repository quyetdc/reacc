@Records = React.createClass
  getInitialState: ->
    records: @props.data
  getDefaultProps: ->
    records: []
  addRecord: (record) ->
    records = @state.records.slice()
    records.push(record)
    @setState records: records

  render: ->
    React.DOM.div
      className: 'records'
      React.DOM.h2
        className: 'title'
        'Records'
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
        React.DOM.tbody null,
          for record in @state.records
            React.createElement Record, key: record.id, record: record
      
      
      