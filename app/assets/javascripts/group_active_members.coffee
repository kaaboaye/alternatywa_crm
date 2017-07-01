date = new Date()
date = new Date date.getFullYear(), date.getMonth(), date.getDate(),
  date.getHours(), date.getMinutes()

@app.controller "GroupActiveMembersCtrl", ["$scope", "$http", ($scope, $http) ->
  $scope.search = {}
  $scope.search.since = new Date(Date.parse(date) - 7 * 24 * 60 * 60 * 1000)
  $scope.search.finish = date
  $scope.search.min_attendece = 1

  $scope.$watch "search", ()->
    $http({
      url: "/groups/" + $scope.group_id + "/active_members.json",
      method: "GET",
      params: $scope.search
    })
    .then (response) ->
      $scope.members = response.data
      $(document).trigger "dom-change"

  , true # on $watch to enable object support
]
