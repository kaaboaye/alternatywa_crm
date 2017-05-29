@app.controller "GroupsCtrl", ($scope, $http) ->
  $scope.$watch "search_name", ()->
    $http.get "/groups/search.json?name=" + ($scope.search_name || "")
    .then (response) ->
      $scope.groups = response.data
