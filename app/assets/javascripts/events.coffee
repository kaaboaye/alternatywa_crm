@app.controller "EventsCtrl", ["$scope", "$http", ($scope, $http) ->
  $scope.$watch "event", ()->
    $http({
      url: "/events/search.json",
      method: "GET",
      params: $scope.event
    })
    .then (response) ->
      $scope.events = response.data
  , true # on $watch to enable object support
]
