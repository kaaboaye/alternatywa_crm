class @PESEL
  constructor: (pesel) ->
    @pesel = pesel

  is_valid: ->
    pesel = @pesel
    masses = [9, 7, 3, 1, 9, 7, 3, 1, 9, 7]
    given_sum = parseInt pesel.substring 10, 11

    sum = 0
    masses.forEach (mass, i) ->
      x = parseInt pesel.substring i, i + 1
      sum += x * mass

    sum = sum % 10

    sum == given_sum

  birth_date: ->
    yy = parseInt @pesel.substring 0, 2
    mm = parseInt @pesel.substring 2, 4
    mm += -1
    dd = parseInt @pesel.substring 4, 6

    switch
      when mm > 80
        yy += 1800
        mm += -80
      when mm > 60
        yy += 2200
        mm += -60
      when mm > 40
        yy += 2100
        mm += -40
      when mm > 20
        yy += 2000
        mm += -20
      else
        yy += 1900

    new Date yy, mm, dd

  sex: ->
    s = parseInt @pesel.substring 9, 10
    s = s % 2

    if s == 1
      "male"
    else
      "female"
