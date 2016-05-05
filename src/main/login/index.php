<?php

include('includes/consumer_keys.php');


session_start();

//The user has logged in
if (isset($_SESSION['twitter_id'])) {
$screen_name = $_SESSION['screen_name'];
echo '<p>@'.$screen_name.' |  <a href='.LOGIN.'/logout.php" title="Click here to logout">Logout</a></p>';
}

//The user has not logged in
else {
echo '<a href="'.LOGIN.'/login_to_twitter.php"><img src="'.LOGIN.'/images/twitterbutton.png" title="Click here to sign in with Twitter!" /></a>';
}

?>