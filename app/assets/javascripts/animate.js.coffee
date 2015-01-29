cardsOpen = true
closeAllCards = ->
  isVertical = $(".card").eq(0).position().left == $(".card").eq(1).position().left
  if isVertical
    cardHeight = $(".card").first().outerHeight()
    top = 0
    $(".card").each (i, val) ->
      $(this).velocity
        top: top
        opacity: 1
      , 500
      top -= cardHeight
  else
    cardWidth = $(".card").first().outerWidth()
    left = 0
    $(".card").each (i, val) ->
      $(this).velocity
        left: left
        opacity: 1
      , 500
      left -= cardWidth

  cardsOpen = false

reopenAllCards = ->
  $(".card").each (i, val) ->
    $(this).velocity
      left: 0
      top: 0
      opacity: 1
      zIndex: "auto"
    , 500
    return

  cardsOpen = true

focusCard = ($card) ->
  $card.zIndex 10

$(document).ready ->
  $(".card").click (e) ->
    if cardsOpen
      focusCard $(e.target).parents(".card")
      closeAllCards()
    else
      reopenAllCards()

