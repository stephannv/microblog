App.cable.subscriptions.create "NewFollowerNotificationChannel",
	received: (data) ->
		console.log( data )
