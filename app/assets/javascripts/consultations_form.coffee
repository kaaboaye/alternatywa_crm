@app.controller "ConsultationsFormCtrl",  ["$scope", "$http", ($scope, $http) ->
  $scope.setup = () ->
    datatime = new Date()
    datatime = new Date datatime.getFullYear(), datatime.getMonth(),
      datatime.getDate(), datatime.getHours(), datatime.getMinutes()

    $scope.taking_member = {}
    $scope.description = ""
    $scope.datetime = datatime

  $scope.set_data = (consultation) ->
    $scope.id = consultation.id
    $scope.taking_member = consultation.member
    $scope.description = consultation.description
    $scope.datetime = new Date consultation.datetime

  $scope.$watch "member", ()->
    $http({
      url: "/members/search.json",
      method: "GET",
      params: $scope.member
    })
    .then (response) ->
      $scope.members = response.data
  , true # on $watch to enable object support

  $scope.set_taking_member = (member) ->
    $scope.taking_member = member

  $scope.create = () ->
    ok = (!!$scope.taking_member.id &&
          !!$scope.datetime &&
          !!$scope.description)

    if ok
      $http({
        url: "/consultations.json",
        method: "POST",
        params: {
          authenticity_token: $("meta[name='csrf-token']").attr('content'),
          member_id: $scope.taking_member.id,
          description: $scope.description,
          datetime: $scope.datetime
        }
      })
      .then (response) ->
        if response.data.success
          alert "Zapisano"
          $scope.setup()
        else
          alert "NIE zapisano"
      , errorCallback = (response) ->
        alert "Błąd: " + response.status
    else
      alert "Nie uzupełniono całego formularza"

  $scope.update = () ->
    ok = (!!$scope.taking_member.id &&
          !!$scope.datetime &&
          !!$scope.description)

    if ok
      $http({
        url: "/consultations/" + $scope.id + ".json",
        method: "PATCH",
        params: {
          authenticity_token: $("meta[name='csrf-token']").attr('content'),
          member_id: $scope.taking_member.id,
          description: $scope.description,
          datetime: $scope.datetime
        }
      })
      .then (response) ->
        if response.data.success
          alert "Zapisano"
        else
          alert "NIE zapisano"
      , errorCallback = (response) ->
        alert "Błąd: " + response.status
    else
      alert "Nie uzupełniono całego formularza"
]
