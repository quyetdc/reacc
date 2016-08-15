@RecordSearch = React.createClass
  getInitialState: ->
    null
  handleSearch: (e) ->
    e.preventDefault()
    $.ajax
      method: 'GET'
      url: '/'
      data:
        search: ReactDOM.findDOMNode(@refs.search).value
      dataType: 'JSON'
    .done @searchSuccessful
  searchSuccessful: (data) ->
    console.log(data)
    @props.handleSearch(data)
  render: ->
    React.DOM.div
      className: 'row search-block'
      React.DOM.form
        className: 'form-group'
        onSubmit: @handleSearch
        React.DOM.div
          className: 'col-md-9'
          React.DOM.input
            className: 'form-control'
            type: 'search'
            ref: 'search'
            placeholder: 'Search record'
        React.DOM.div
          className: 'col-md-3'
          React.DOM.button
            className: 'btn btn-primary'
            type: 'submit'
            'Search'
