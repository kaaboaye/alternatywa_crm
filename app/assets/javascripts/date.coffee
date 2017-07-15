@app.directive "date", [() ->
  link: (scope, element, attr) ->
    d = new Date attr.value

    dd = d.getDate()
    MM = d.getMonth()+1
    yy = d.getFullYear()

    if dd < 10
      dd = "0" + dd

    if MM < 10
      MM = "0" + MM

    scope.date = dd + "." + MM + "." + yy

  scope: {},
  template: "{{date}}"
]
