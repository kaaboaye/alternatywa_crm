convert_date = @convert_date

date = new Date()
date = new Date date.getFullYear(), date.getMonth(), date.getDate(), date.getHours(), date.getMinutes()

@app.controller "LessonsIndexCtrl", ($scope, $http) ->
  $scope.since = new Date(Date.parse(date) - 30 * 24 * 60 * 60 * 1000)
  $scope.finish = date

  $scope.$watch "[lesson_subject_id, since, finish]", ()->
    $http({
      url: "/lessons/search.json",
      method: "GET",
      params: {
        lesson_subject_id: $scope.lesson_subject_id,
        since: convert_date($scope.since),
        finish: convert_date($scope.finish)
      }
    })
    .then (response) ->
      response.data.forEach (r) ->
        d = new Date(r.datetime)

        dd = d.getDate()
        MM = d.getMonth()+1
        yy = d.getFullYear()
        hh = d.getHours()
        mm = d.getMinutes()

        if mm < 10
          mm = "0" + mm

        r.datetime = dd + "." + MM + "." + yy + " " + hh + ":" + mm

      $scope.lessons = response.data
  , true # on $watch to enable object support
