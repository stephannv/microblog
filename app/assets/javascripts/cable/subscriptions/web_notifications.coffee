App.cable.subscriptions.create "NewFollowerNotificationChannel",
	received: (data) ->
		alertify.notify(
			'<a href="/users/underwood/profile">underwood seguiu você</a>', 'purple', 10
		);
