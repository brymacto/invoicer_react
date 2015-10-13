  @amountFormat = (amount) ->
    '$' + (Number(amount)).toFixed(2).toLocaleString()

  @truncString = (fullString) ->
    if fullString
      newString = fullString.substring(0,30)
      if newString.length != fullString.length
        return newString.concat('...')
      return newString
    else
      ''
