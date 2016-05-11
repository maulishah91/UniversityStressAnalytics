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
echo'
<html>
<head>
	<title>University Stress Analytics</title>
<link rel="stylesheet" type="text/css" href="css/style.css">
</head>
<body>
    <div id="container">
        <form>
            <label for="email">Email:</label>
            <input type="email" id="email" placeholder="Email Address">
            <label for="password">Password:</label>
            <input type="password" id="password" name="password">
            <div id="lower">
                <input type="submit" value="Login">
            </div><!--/ lower-->
        </form>
<br/>
<br/>
OR 
<br/>
<br/>
';
echo '<a href="'.LOGIN.'/login_to_twitter.php"><img src="images/twitterbutton.png" title="Click here to sign in with Twitter!" /></a>';

echo '
</div>
</body>
</html>';
}

?>