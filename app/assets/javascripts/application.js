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
        var arr = [];

        // Some useful debug msgs
        pusher.connection.bind('connecting', function() {
        	$('#chat-messages').html('Connecting to Pusher...');
        });
        pusher.connection.bind('connected', function() {
        	$('#chat-messages').html('Connected to Pusher!');
        });

        pusher.connection.bind('pusher:subscription_succeeded', function(members){
            members.each(function(member){
                add_member(member.id);
            });
        });
        pusher.connection.bind('failed', function() {
        	$('#chat-messages').text('Connection to Pusher failed :(');
        });
        channel.bind('subscription_error', function(status) {
        	$('#chat-messages').text('Pusher subscription_error');
        });

        channel.bind('new-message', function(data) {
        	/*var node = document.createElement("p");
									node.innerHTML = "<strong>" + data.uid + "</strong>: " + data.message;
									document.getElementById("chat-messages").appendChild(node);
									$messages = $('#chat-messages');*/
    					$("#chat-messages").append('<p class="row"><strong>' + data.uid + ":</strong>" + data.message + '</p>');
    					$("#chat-messages").animate({ scrollTop: $("#chat-messages")[0].scrollHeight }, "slow");
								});
       });

function add_member(member){
    arr.push(member);
}

function submit() {
	var message = document.getElementById('chat-text-input').value;
    $('#chat-text-input').innerHTML = "";
	//alert(message);
	$.ajax({
		type: "POST",
		url: "/welcome/submit",
		data: {message: message}
	});
}