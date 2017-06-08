@app.controller "LessonSubjectCtrl", ($scope, $http) ->
  $scope.$watch "name", ()->
    $http({
      url: "/lessons/subjects/search.json",
      method: "GET",
      params: {name: $scope.name}
    })
    .then (response) ->
      $scope.lesson_subjects = response.data
  , true # on $watch to enable object support
