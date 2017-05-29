@app.controller "MembersCtrl", ($scope, $http) ->
  $scope.$watch "member", ()->
    $http({
      url: "/members/search.json",
      method: "GET",
      params: $scope.member
    })
    .then (response) ->
      $scope.members = response.data
  , true # on $watch to enable object support
