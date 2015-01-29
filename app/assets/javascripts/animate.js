var cardsOpen = true;

var closeAllCards = function() {
  var cardWidth = $('.card').first().outerWidth();
  var left = 0;

  $(".card").each(function(i, val) {
    $(this).velocity({
      left: left,
      opacity: 1
    }, 500);
    left -= cardWidth;
  });
  cardsOpen = false;
};

var reopenAllCards = function() {
  $(".card").each(function(i, val) {
    $(this).velocity({
      left: 0,
      opacity: 1,
      zIndex: 'auto'
    }, 500);
  });

  cardsOpen = true;
};

var focusCard = function($card) {
  $card.zIndex(10);
};

$(document).ready(function() {
  $(".card").click(function(e) {
    if (cardsOpen) {
      focusCard($(e.target).parents('.card'));
      closeAllCards();
    } else {
      reopenAllCards();
    }
  });
});


// var cardsOpen = true;

// var closeAllCards = function() {
//   var left = 0;
//   var width = $('.card').first().outerWidth();

//   $(".card").each(function(i, val) {
//     $(this).velocity({
//       left: left,
//       opacity: 1
//     }, 500);
//     left -= width;
//   });
//   cardsOpen = false;
// };

// var reopenAllCards = function() {
//   $(".card").each(function(i, val) {
//     $(this).velocity({
//       left: 0,
//       opacity: 1
//     }, 500);
//   });

//   cardsOpen = true;
// };

// $(document).ready(function() {
//   $(".card").click(function() {
//     if (cardsOpen) {
//       closeAllCards();
//     } else {
//       reopenAllCards();
//     }
//   });
// });
