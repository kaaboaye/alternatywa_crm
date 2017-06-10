@app.directive "datetime", [() ->
  link: (scope, element, attr) ->
    d = new Date attr.value

    dd = d.getDate()
    MM = d.getMonth()+1
    yy = d.getFullYear()
    hh = d.getHours()
    mm = d.getMinutes()

    if dd < 10
      dd = "0" + dd

    if MM < 10
      MM = "0" + MM

    if hh < 10
      hh = "0" + hh

    if mm < 10
      mm = "0" + mm

    scope.datetime = dd + "." + MM + "." + yy + " " + hh + ":" + mm

  template: "{{datetime}}"
]
