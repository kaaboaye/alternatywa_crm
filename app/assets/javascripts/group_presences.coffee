datatime = new Date()
datatime = new Date datatime.getFullYear(), datatime.getMonth(), datatime.getDate(), datatime.getHours(), datatime.getMinutes()

convert_date = @convert_date

@app.controller "GroupPresenceCtrl",  ["$scope", "$http", ($scope, $http) ->
  $scope.hard_date = false
  $scope.datetime = datatime
  $scope.added_members = []

  $scope.$watch "member", ()->
    $http({
      url: "/members/search.json",
      method: "GET",
      params: $scope.member
    })
    .then (response) ->
      $scope.members = response.data
  , true # on $watch to enable object support
  # end

  update_added = () ->
    $http({
      url: "search.json",
      method: "GET",
      params: {datetime: $scope.date}
    })
    .then (response) ->
      $scope.added_members = response.data
  # end

  $scope.$watch "datetime", () ->
    if ! $scope.hard_date
      $scope.date = convert_date $scope.datetime

  $scope.$watch "date", update_added

  $scope.set_date = (d) ->
    $scope.hard_date = true
    $scope.date = parseInt d

  $scope.add = (member) ->
    is_exist = false

    $scope.added_members.forEach (presence) ->
      if presence.member_id == member.id
        is_exist = true

    if ! is_exist
      $http({
        url: "create.json",
        method: "POST",
        params: {
          authenticity_token: $("meta[name='csrf-token']").attr('content'),
          member_id: member.id,
          datetime: $scope.date
        }
      })
      .then (response) ->
        update_added()
  # end

  $scope.destroy = (presence) ->
    $http({
      url: "/groups/presence.json",
      method: "DELETE",
      params: {
        authenticity_token: $("meta[name='csrf-token']").attr('content'),
        id: presence.id
      }
    })
    .then (response) ->
      update_added()
  # end
]
