@Record = React.createClass
  getInitialState: ->
    edit: false
  handleToggle: (e) ->
    e.preventDefault()
    @setState edit: !@state.edit
  handleDelete: (e) ->
    e.preventDefault()
    $.ajax
      method: 'DELETE'
      url: "records/#{@props.record.id}"
      dataType: 'JSON'
    .done @deleteSuccessful
    .fail @deleteFail

  deleteSuccessful: (data, textStatus, jqXHR) ->
    @props.handleDeleteRecord @props.record

  deleteFail: (xhr, status, err) ->
    console.error err.toString()

  handleEdit: (e) ->
    e.preventDefault()
    data =
      record:
        title: ReactDOM.findDOMNode(@refs.title).value
        date: ReactDOM.findDOMNode(@refs.date).value
        amount: ReactDOM.findDOMNode(@refs.amount).value
    $.ajax
      method: 'PUT'
      url: "records/#{@props.record.id}"
      dataType: 'JSON'
      data: data
    .done @updateSuccessful
    .fail @updateFail

  updateSuccessful: (data, textStatus, jqXHR) ->
    @setState edit: !@state.edit
    @props.handleEditRecord @props.record, data

  updateFail: (xhr, status, err) ->
#    console.error err.toString()

# Row information - read only state
  recordRow: ->
    React.DOM.tr null,
      React.DOM.td
        className: 'col-md-3'
        @props.record.date
      React.DOM.td
        className: 'col-md-3'
        @props.record.title
      React.DOM.td
        className: 'col-md-3'
        amountFormat(@props.record.amount)
      React.DOM.td
        className: 'col-md-3'
        React.DOM.button
          className: 'btn btn-danger'
          onClick: @handleDelete
          'Delete'
        React.DOM.button
          className: 'btn btn-default small-left-margin'
          onClick: @handleToggle
          'Edit'

  # Row as form for editable
  # We use ref to access to the input field and get its value via @refs
  recordForm: ->
    React.DOM.tr null,
      React.DOM.td
        className: 'col-md-3'
        React.DOM.input
            className: 'form-control'
            defaultValue: @props.record.date
            type: 'text'
            ref: 'date'

      React.DOM.td
        className: 'col-md-3'
        React.DOM.input
          className: 'form-control'
          defaultValue: @props.record.title
          type: 'text'
          ref: 'title'

      React.DOM.td
        className: 'col-md-3'
        React.DOM.input
          className: 'form-control'
          defaultValue: @props.record.amount
          type: 'text'
          ref: 'amount'

      React.DOM.td
        className: 'col-md-3'
        React.DOM.a
          className: 'btn btn-primary'
          onClick: @handleEdit
          'Edit'
        React.DOM.a
          className: 'btn btn-default small-left-margin'
          onClick: @handleToggle
          'Cancel'
  render: ->
    if @state.edit
      @recordForm()
    else
      @recordRow()