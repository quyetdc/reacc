@AmountBox = React.createClass
  render: ->
    React.DOM.div
      className: 'col-md-4'
      React.DOM.div
        className: "panel panel-#{@props.type}"
        React.DOM.div
          className: 'panel-heading'
          React.DOM.h3
            className: 'panel-title'
            @props.name
        React.DOM.div
          className: 'panel-body'
          "#{amountFormat @props.amount}"