@app.controller "ConsultationsFormCtrl",  ["$scope", "$http", ($scope, $http) ->
  $scope.setup = () ->
    datatime = new Date()
    datatime = new Date datatime.getFullYear(), datatime.getMonth(),
      datatime.getDate(), datatime.getHours(), datatime.getMinutes()

    $scope.taking_member = {}
    $scope.datetime = datatime

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

  $scope.create = (member) ->
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
]
