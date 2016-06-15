<?php
require_once('TwitterAPIExchange.php');
require_once('includes/keys.php');
require_once('db-connect.php');

$settings = array(
    'oauth_access_token' => OAUTH_ACCESS_TOKEN,
    'oauth_access_token_secret' => OAUTH_ACCESS_TOKEN_SECRET,
    'consumer_key' => CONSUMER_KEY,
    'consumer_secret' => CONSUMER_SECRET
);

$url = 'https://api.twitter.com/1.1/search/tweets.json';
$requestMethod = 'GET';

$query = "select * from hashtags";
$retval = mysql_query($query);
if (!$retval) {
    die('Could not get data: ' . mysql_error());
} else {
    while($row = mysql_fetch_array($retval)) {
    	$getfield = '?q='.$row[2].'&lang=en&count=10';
    	#$getfield = '?q=#UCLA&count=1';
		$twitter = new TwitterAPIExchange($settings);
		$result =  $twitter->setGetfield($getfield)
		    ->buildOauth($url, $requestMethod)
		    ->performRequest();

		$response = json_decode($result, true);
		$file = fopen("../python/input/".$row[1].".csv","w");

		foreach($response['statuses'] as $tweet) {
	 	    $text = $tweet['text'];
			echo fwrite($file,$text."\n");
		}
		fclose($file);
   }
}

#echo $result;

?>