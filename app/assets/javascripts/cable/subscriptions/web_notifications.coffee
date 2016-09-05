App.cable.subscriptions.create "NewFollowerNotificationChannel",
	received: (data) ->
		alertify.notify(
			'<a href="/users/'+ data['username']+'/profile">'+ data['username']+' seguiu você</a>',
			'purple', 10
		);
