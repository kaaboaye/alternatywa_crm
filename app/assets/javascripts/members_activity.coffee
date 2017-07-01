date = new Date()
date = new Date date.getFullYear(), date.getMonth(), date.getDate(),
  date.getHours(), date.getMinutes()

@app.controller "MembersActivityCtrl", ["$scope", "$http", ($scope, $http) ->
  $scope.search = {}
  $scope.search.since = new Date(Date.parse(date) - 30 * 24 * 60 * 60 * 1000)
  $scope.search.finish = date

  $scope.$watch "search", ()->
    $http({
      url: "/members/" + $scope.member_id + "/activity.json",
      method: "GET",
      params: $scope.search
    })
    .then (response) ->
      $scope.activities = response.data
  , true # on $watch to enable object support
]
