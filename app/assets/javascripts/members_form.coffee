PESEL = @PESEL

@app.controller "MembersFormCtrl", ["$scope", ($scope) ->
  $scope.pesel = $("input[ng-model='pesel']").val()

  $scope.$watch "pesel", () ->
    pesel = new PESEL $scope.pesel
    $scope.is_pesel = pesel.is_valid()
    $scope.birth_date = pesel.birth_date()
]
