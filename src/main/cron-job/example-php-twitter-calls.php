<?php
require_once('TwitterAPIExchange.php');
$settings = array(
    'oauth_access_token' => "811321561-r44VmUPpXeK7ndpcvj9QbKfGWpdtZqPk8EArp8hf",
    'oauth_access_token_secret' => "aElMsc9OrT7O3wdqrTHxbjpcNnhBY9YnIq49vnM1eO2a5",
    'consumer_key' => "7uBwsMCamrmNAUqB77qUiGjHc",
    'consumer_secret' => "PclZ8z3lrRBuEnACrzUo6tGQulyp7wVH6tj5IRUsS5gG6zWQ9A"
);

$url = 'https://api.twitter.com/1.1/search/tweets.json';
$getfield = '?q=#UCLA&count=100';
$requestMethod = 'GET';

$twitter = new TwitterAPIExchange($settings);
$result =  $twitter->setGetfield($getfield)
    ->buildOauth($url, $requestMethod)
    ->performRequest();

$response = json_decode($result, true);

foreach($response['statuses'] as $tweet)
{
    $text = $tweet['text'];
    echo $text;
    echo "\n";
}

?>