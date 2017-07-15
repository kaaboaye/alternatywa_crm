@app.directive "time", [() ->
  link: (scope, element, attr) ->
    d = new Date attr.value

    hh = d.getHours()
    mm = d.getMinutes()

    if mm < 10
      mm = "0" + mm

    scope.time = hh + ":" + mm

  scope: {},
  template: "{{time}}"
]
