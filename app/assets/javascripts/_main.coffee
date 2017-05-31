@app = angular.module "app", []

@convert_date = (date) ->
  date = Date.parse date
  date = date.toString()
  date.slice 0, -3
