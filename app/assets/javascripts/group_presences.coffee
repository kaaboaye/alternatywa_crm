date = new Date()
date = new Date date.getFullYear(), date.getMonth(), date.getDate(), date.getHours(), date.getMinutes()

@app.controller "GroupPresenceCtrl", ($scope, $http) ->
  $scope.time = date

  $scope.$watch "member", ()->
    $http({
      url: "/members/search.json",
      method: "GET",
      params: $scope.member
    })
    .then (response) ->
      $scope.members = response.data
  , true # on $watch to enable object support
