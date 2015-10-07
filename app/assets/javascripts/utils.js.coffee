  @amountFormat = (amount) ->
    '$ ' + (Number(amount)).toFixed(2).toLocaleString()