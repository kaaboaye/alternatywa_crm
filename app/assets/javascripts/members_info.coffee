@app.controller "MembersInfoCtrl",  ["$scope", "$http", ($scope, $http) ->
  $scope.note = $("textarea[ng-model='note']").val()

  $scope.set_id = (id) ->
    $scope.id = id

  $scope.save = ->
    $http({
      url: $scope.id + ".json",
      method: "PATCH",
      params: {
        authenticity_token: $("input[name='authenticity_token']").val(),
        "member[note]": $scope.note
      }
    })
    .then (response) ->
      if response.data.success
        alert "Zapisano"
      else
        alert "Nie zapisano"
]
