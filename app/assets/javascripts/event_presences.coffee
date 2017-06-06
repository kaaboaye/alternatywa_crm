datatime = new Date()
datatime = new Date datatime.getFullYear(), datatime.getMonth(), datatime.getDate(), datatime.getHours(), datatime.getMinutes()

convert_date = @convert_date

@app.controller "EventPresenceCtrl", ($scope, $http) ->
  $scope.added_members = []
  $scope.time = new Date 2000, 1, 1, 2, 0

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
      url: "presence/list.json",
      method: "GET"
    })
    .then (response) ->
      response.data.forEach (r) ->
        time = new Date(r.time)
        hh = time.getHours()
        mm = time.getMinutes()

        if mm < 10
          mm = "0" + mm

        r.time = hh + ":" + mm

      $scope.added_members = response.data
  # end

  $scope.update_added = update_added

  $scope.add = (member) ->
    is_exist = false

    $scope.added_members.forEach (_member) ->
      if _member.id == member.id
        is_exist = true

    if ! is_exist
      $http({
        url: "presence/create.json",
        method: "POST",
        params: {
          authenticity_token: $("meta[name='csrf-token']").attr('content'),
          member_id: member.id,
          time: $scope.time
        }
      })
      .then (response) ->
        update_added()
  # end

  $scope.destroy = (id) ->
    $http({
      url: "/events/presence.json",
      method: "DELETE",
      params: {
        authenticity_token: $("meta[name='csrf-token']").attr('content'),
        id: id
      }
    })
    .then (response) ->
      update_added()
  # end
