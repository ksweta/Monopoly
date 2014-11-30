// This is a manifest file that'll be compiled into application.js, which will include all the files
// listed below.
//
// Any JavaScript/Coffee file within this directory, lib/assets/javascripts, vendor/assets/javascripts,
// or vendor/assets/javascripts of plugins, if any, can be referenced here using a relative path.
//
// It's not advisable to add code directly here, but if you do, it'll appear at the bottom of the
// compiled file.
//
// Read Sprockets README (https://github.com/sstephenson/sprockets#sprockets-directives) for details
// about supported directives.
//
//= require jquery
//= require jquery_ujs
//= require turbolinks

$(function() {
        var pusher = new Pusher('4eff344ae11ed3c814c8'); // Replace with your app key
        var channel = pusher.subscribe('public-chat');

        // Some useful debug msgs
        pusher.connection.bind('connecting', function() {
        	$('.chat-messages').html('Connecting to Pusher...');
        });
        pusher.connection.bind('connected', function() {
        	$('.chat-messages').html('Connected to Pusher!');
        });
        pusher.connection.bind('failed', function() {
        	$('.chat-messages').text('Connection to Pusher failed :(');
        });
        channel.bind('subscription_error', function(status) {
        	$('.chat-messages').text('Pusher subscription_error');
        });

        channel.bind('new-message', function(data) {
        	$('.chat-messages').html('<strong>' + data.uid + '</strong>: ' + data.message);
        });
       });

function submit() {
	var message = document.getElementById('chat-text-input').value;
	//alert(message);
	$.ajax({
		type: "POST",
		url: "/welcome/submit",
		data: {message: message}
	});
}