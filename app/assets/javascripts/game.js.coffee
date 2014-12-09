# Place all the behaviors and hooks related to the matching controller here.
# All this logic will automatically be available in application.js.
# You can use CoffeeScript in this file: http://coffeescript.org/

	window.chat_submit = ->
		message = $("#text").val()
		id = $("#game-id").val()
		#alert id
		$.ajax
   type: "POST"
   url: "chat_message"
   data: {message: message, id: id}
	
	window.start_game = ->
		id = $("#game-id").val()
		alert "yo"
		$.ajax
   type: "POST"
   url: "start_button"
   data: {id: id}