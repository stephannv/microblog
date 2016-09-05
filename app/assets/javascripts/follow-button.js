$(function(){
	$('.follow-button').click( followUserAndChangeButton );
	$('.unfollow-button').click( unfollowUserAndChangeButton );

	function followUserAndChangeButton(){
		$link = $(this);
		$.post( "/users/"+ $link.data('user') + "/follow" , function() {
			changeLinkToUnfollow( $link );
		}).fail( function(){
			alert( 'um erro aconteceu' );
		});
	};

	function unfollowUserAndChangeButton(){
		$link = $(this);
		$.ajax({
			url: "/users/"+ $link.data('user') + "/unfollow",
			type: 'DELETE',
			success: function() {
				changeLinkToFollow( $link );
			},
			error: function(){
				alert('Um erro aconteceu');
			}
		});
	};

	function changeLinkToUnfollow( $link ){
		$link.removeClass('purple follow-button').addClass('unfollow-button');
		$link.html('Deixar de Seguir');
		$link.unbind( "click" );
		$link.click( unfollowUserAndChangeButton );
	};

	function changeLinkToFollow( $link ){
		$link.removeClass('unfollow-button').addClass('follow-button purple');
		$link.html('Seguir');
		$link.unbind( "click" );
		$link.click( followUserAndChangeButton );
	};
});
