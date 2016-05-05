<?php

include('EpiCurl.php');
include('EpiOAuth.php');
include('EpiTwitter.php');
include('includes/consumer_keys.php');

$twitterObj = new EpiTwitter(CONSUMER_KEY, CONSUMER_SECRET);

$authenticateUrl = $twitterObj->getAuthenticateUrl();

/* Redirect to the Twitter login page */
header('Location: '.$authenticateUrl.'');

?>