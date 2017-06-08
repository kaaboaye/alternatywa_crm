@app.controller "SchoolsCtrl",  ["$scope", "$http", ($scope, $http) ->
  $scope.$watch "search_name", ()->
    $http.get "/schools/search.json?name=" + ($scope.search_name || "")
    .then (response) ->
      $scope.schools = response.data
]
