@RecordForm = React.createClass
  getInitialState: ->
    title: ''
    date: ''
    amount: ''
  handleChange: (e) ->
    name = e.target.name
    @setState "#{ name }": e.target.value
  valid: ->
    @state.title && @state.date && @state.amount
  handleSubmit: (e) ->
    e.preventDefault()
    $.ajax
      url: 'records',
      dataType: 'JSON'
      data: { record: @state }
      method: 'post'
    .done @createSuccessful
    .fail @createFail

  createSuccessful: (data, textStatus, jqXHR) ->
    @props.handleNewRecord data
    @setState @getInitialState()

  createFail: (xhr, status, err) ->
    console.error @props.url, status, err.toString()
    @setState @getInitialState()

  render: ->
    React.DOM.form
      className: 'form-inline'
      onSubmit: @handleSubmit
      React.DOM.div
        className: 'form-group'
        React.DOM.input
          type: 'text'
          className: 'form-control'
          placeholder: 'Date'
          name: 'date'
          value: @state.date
          onChange: @handleChange
      React.DOM.div
        className: 'form-group'
        React.DOM.input
          type: 'text'
          className: 'form-control'
          placeholder: 'Title'
          name: 'title'
          value: @state.title
          onChange: @handleChange
      React.DOM.div
        className: 'form-group'
        React.DOM.input
          type: 'text'
          className: 'form-control'
          placeholder: 'Amount'
          name: 'amount'
          value: @state.amount
          onChange: @handleChange
      React.DOM.button
        className: 'btn btn-primary'
        type: 'submit'
        disabled: !@valid()
        'Create record'