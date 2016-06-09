<?php
require_once('TwitterAPIExchange.php');
require_once('includes/keys.php');
$settings = array(
    'oauth_access_token' => OAUTH_ACCESS_TOKEN,
    'oauth_access_token_secret' => OAUTH_ACCESS_TOKEN_SECRET,
    'consumer_key' => CONSUMER_KEY,
    'consumer_secret' => CONSUMER_SECRET
);

$url = 'https://api.twitter.com/1.1/search/tweets.json';

$universities = array("UCLA", "Stanford", "USC", "MIT", "Harvard", "NYU", "UC Berkeley", "Carnegie Mellon", "Cornell", "Columbia");
$hashtags = 
foreach($response['statuses'] as $tweet) {
		
}

$getfield = '?q=#UCLA&count=5';
$requestMethod = 'GET';

$twitter = new TwitterAPIExchange($settings);
$result =  $twitter->setGetfield($getfield)
    ->buildOauth($url, $requestMethod)
    ->performRequest();

$response = json_decode($result, true);

foreach($response['statuses'] as $tweet) {
    $text = $tweet['text'];
    echo $text;
    echo "\n";
}

?>