(function() {
  jQuery(function() {
    $(document).ready();
    return window.chat_submit = function() {
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
  });

}).call(this);
