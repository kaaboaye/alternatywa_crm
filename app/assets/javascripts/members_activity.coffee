date = new Date()
date = new Date date.getFullYear(), date.getMonth(), date.getDate(),
  date.getHours(), date.getMinutes()

convert_date = @convert_date

@app.controller "MembersActivityCtrl", ["$scope", "$http", ($scope, $http) ->
  $scope.search = {}
  $scope.search.since = new Date(Date.parse(date) - 30 * 24 * 60 * 60 * 1000)
  $scope.search.finish = date
  $scope.number_of_hours = "00:00"

  $scope.$watch "search", ()->
    $http({
      url: "/members/" + $scope.member_id + "/activity.json",
      method: "GET",
      params: $scope.search
    })
    .then (response) ->
      $scope.activities = response.data

      noh = $scope.activities.reduce (x, activity) ->
        atime = new Date activity.time

        time = 0
        time += 60 * atime.getHours()
        time += atime.getMinutes()

        x + time
      , 0

      noh = Math.floor noh

      if noh > 0
        hh = Math.floor noh / 60
        mm = noh % 60
        
        if mm < 10
          mm = "0" + mm

        $scope.number_of_hours = hh + ":" + mm
      else
        $scope.number_of_hours = "00:00"

  , true # on $watch to enable object support

  $scope.number_of_hours = () ->
    $scope.activities.reduce (x, activity) ->
      time = activity.time

      x + time
    , 0
]
