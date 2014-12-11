(function() {
  window.chat_submit = function() {
    var id, message;
    message = $("#text").val();
    id = $("#game-id").val();
    return $.ajax({
      type: "POST",
      url: "chat_message",
      data: {
        message: message,
        id: id
      }
    });
  };

  window.start_game = function() {
    var id;
    id = $("#game-id").val();
    return $.ajax({
      type: "POST",
      url: "start_button",
      data: {
        id: id
      }
    });
  };

  window.roll_dice = function() {
    var id;
    id = $("#game-id").val();
    return $.ajax({
      type: "POST",
      url: "roll_dice",
      data: {
        id: id
      }
    });
  };

}).call(this);
