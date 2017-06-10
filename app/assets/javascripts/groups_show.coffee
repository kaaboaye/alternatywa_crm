date = new Date()
date = new Date date.getFullYear(), date.getMonth(), date.getDate(), date.getHours(), date.getMinutes()

convert_date = @convert_date

@app.controller "GroupsShowCtrl", ["$scope", "$http", ($scope, $http) ->
  $scope.since = new Date(Date.parse(date) - 30 * 24 * 60 * 60 * 1000)
  $scope.finish = date
  $scope.lists = []

  $scope.$watch "[since, finish]", () ->
    $scope.errors = []
    if Date.parse($scope.since) >= Date.parse($scope.finish)
      $scope.errors.push "Data od powinna być mniejsza niż data do"

    $http({
      url: $scope.group_id + "/search_lists.json",
      method: "GET",
      params: {
        since: convert_date($scope.since),
        finish: convert_date($scope.finish)
      }
    })
    .then (response) ->
      $scope.lists = []

      response.data.forEach (list) ->
        l = {}
        l.id = convert_date new Date list.datetime
        l.datetime = list.datetime

        $scope.lists.push l
  , true
]
