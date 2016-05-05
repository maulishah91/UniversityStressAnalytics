<?php 
session_start();

include('EpiCurl.php');
include('EpiOAuth.php');
include('EpiTwitter.php');
include('includes/consumer_keys.php');

/* Once the user authenticates with Twitter they are redirected back to the callback url along with a "request token" called "oauth_token" This is the same "request token from login_to_twitter.php" */ 
if (isset($_GET['oauth_token'])) {
 
$twitterObj = new EpiTwitter(CONSUMER_KEY, CONSUMER_SECRET);
 
/* Use the setToken method to set the "access token" and "access token secret key" by using the "request token". We need these to later access the users information such as user name */
$twitterObj->setToken($_GET['oauth_token']);
$token = $twitterObj->getAccessToken();
$twitterObj->setToken($token->oauth_token, $token->oauth_token_secret);
 
/* Get user data from the twitter account
* $screen_name is the @name
* $twitter_id is the id of the user - one can change the @name but not the id
* You can also get other types of information from the user here
*/ 
$userdata = $twitterObj->get_accountVerify_credentials();
 
$twitter_id  = $userdata->id;
$screen_name = $userdata->screen_name; 


//Set the session variables
$_SESSION['twitter_id']  = $twitter_id;
$_SESSION['screen_name']  = $screen_name; //This is the @name

//Here you can add code if you want to save the $twitter_id in the database

} 
/* The user clicked on "Cancel, and return to app" when asked to login at the twitter.com page or the user managed to find this file on his own without first being connected to the twitter.com page */
else {
//Send back the user to the main page
header('Location: '.LOGIN);
}
?>