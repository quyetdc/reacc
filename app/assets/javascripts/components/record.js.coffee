@Record = React.createClass
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

  render: ->
    React.DOM.tr null,
      React.DOM.td null, @props.record.date
      React.DOM.td null, @props.record.title
      React.DOM.td null, amountFormat(@props.record.amount)
      React.DOM.td null,
        React.DOM.button
          className: 'btn btn-danger'
          onClick: @handleDelete
          'Delete'