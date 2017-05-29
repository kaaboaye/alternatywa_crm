@app.controller "EventsCtrl", ($scope, $http) ->
  $scope.$watch "search_name", ()->
    $http.get "/events/search.json?name=" + ($scope.search_name || "")
    .then (response) ->
      $scope.events = response.data
