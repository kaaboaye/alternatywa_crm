convert_date = @convert_date

date = new Date()
date = new Date date.getFullYear(), date.getMonth(), date.getDate(),
  date.getHours(), date.getMinutes()

@app.controller "ConsultationsIndexCtrl",  ["$scope", "$http", ($scope, $http) ->
  $scope.since = new Date(Date.parse(date) - 30 * 24 * 60 * 60 * 1000)
  $scope.finish = date

  $scope.$watch "[since, finish]", ()->
    $http({
      url: "/consultations/search.json",
      method: "GET",
      params: {
        since: convert_date($scope.since),
        finish: convert_date($scope.finish)
      }
    })
    .then (response) ->
      $scope.consultations = response.data
  , true # on $watch to enable object support
]
