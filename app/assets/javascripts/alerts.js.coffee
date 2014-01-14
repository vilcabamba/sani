class Alert
  constructor: (text) ->
    alertify.log(text)

alertsHelper =
  init: ->
    for alert in $("#alerts .alert")
      new Alert(alert.textContent)
      alert.remove()

jQuery ->
  alertsHelper.init()
