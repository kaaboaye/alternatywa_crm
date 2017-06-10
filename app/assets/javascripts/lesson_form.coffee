@app.controller "LessonFormCtrl",  ["$scope", "$http", ($scope, $http) ->
  $scope.setup = () ->
    datatime = new Date()
    datatime = new Date datatime.getFullYear(), datatime.getMonth(),
      datatime.getDate(), datatime.getHours(), datatime.getMinutes()

    $scope.giving_member = {}
    $scope.taking_member = {}
    $scope.lesson_subject_id = ""
    $scope.time = new Date 2000, 1, 1, 0, 45
    $scope.datetime = datatime

  $scope.set_data = (lesson) ->
    $scope.id = lesson.id
    $scope.giving_member = lesson.giving_member
    $scope.taking_member = lesson.taking_member
    $scope.lesson_subjects = lesson.lesson_subjects
    $scope.time = new Date lesson.time
    $scope.datetime = new Date lesson.datetime

    $scope.lesson_subjects.forEach (ls) ->
      if ls.id == lesson.lesson_subject.id
        $scope.lesson_subject_id = ls

  $scope.$watch "member", ()->
    $http({
      url: "/members/search.json",
      method: "GET",
      params: $scope.member
    })
    .then (response) ->
      $scope.members = response.data
  , true # on $watch to enable object support

  $scope.set_giving_member = (member) ->
    $scope.giving_member = member

  $scope.set_taking_member = (member) ->
    $scope.taking_member = member

  $scope.create = () ->
    ok = (!!$scope.giving_member.id &&
          !!$scope.taking_member.id &&
          !!$scope.lesson_subject_id &&
          !!$scope.time &&
          !!$scope.datetime)

    if ok
      $http({
        url: "/lessons.json",
        method: "POST",
        params: {
          authenticity_token: $("meta[name='csrf-token']").attr('content'),
          giving_member_id: $scope.giving_member.id,
          taking_member_id: $scope.taking_member.id,
          lesson_subject_id: $scope.lesson_subject_id,
          time: $scope.time,
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
    ok = (!!$scope.giving_member.id &&
          !!$scope.taking_member.id &&
          !!$scope.lesson_subject_id &&
          !!$scope.time &&
          !!$scope.datetime)

    if ok
      $http({
        url: "/lessons/" + $scope.id + ".json",
        method: "PATCH",
        params: {
          authenticity_token: $("meta[name='csrf-token']").attr('content'),
          giving_member_id: $scope.giving_member.id,
          taking_member_id: $scope.taking_member.id,
          lesson_subject_id: $scope.lesson_subject_id.id,
          time: $scope.time,
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
