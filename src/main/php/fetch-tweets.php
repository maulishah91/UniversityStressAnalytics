<?php
require_once('TwitterAPIExchange.php');
require_once('includes/keys.php');
require_once('db-connect.php');
require_once('remove-stopwords.php');


$settings = array(
    'oauth_access_token' => OAUTH_ACCESS_TOKEN,
    'oauth_access_token_secret' => OAUTH_ACCESS_TOKEN_SECRET,
    'consumer_key' => CONSUMER_KEY,
    'consumer_secret' => CONSUMER_SECRET
);
$url = 'https://api.twitter.com/1.1/search/tweets.json';
$requestMethod = 'GET';
$select_query = "select * from hashtags";
$retval = mysql_query($select_query);
$university_names=array();
if (!$retval) {
    die('Could not get data: ' . mysql_error());
} else {
    while($row = mysql_fetch_array($retval)) {
    	$getfield = '?q='.$row[2].'&lang=en&count=100&since_id='.$row[3];
    	#$getfield = '?q=#UCLA&count=3&since_id=0743155561215078400';
		$twitter = new TwitterAPIExchange($settings);
		$result =  $twitter->setGetfield($getfield)
		    ->buildOauth($url, $requestMethod)
		    ->performRequest();
		$response = json_decode($result, true);
		$input_file = fopen("../python/input/".$row[1].".csv","w");
		#for each university
		echo "for university: ".$row[1]."\n";
		$university_names[]="".$row[1]."";
		
		foreach($response['statuses'] as $tweet) {
	 	    $id = $tweet['id'];
	 	    $timestamp = strtotime($tweet['created_at']);
	 	    $normalized_timestamp = strtotime("midnight", $timestamp); //beginOfDay
	 	    $text = $tweet['text'];
	 	    $text = trim(preg_replace('/\s+/', ' ', $text));
	 	    $text = preg_replace('/[,]/', '', $text);
	 	    $text = trim($text, ',');
	 	    
			fwrite($input_file,$id.", ".$text."\n");
			$tweetText = mysql_real_escape_string($text);
			$insert_query = "insert into tweets(tweetId, university, raw_timestamp, normalized_timestamp, tweetText) values('".$id."','".$row[1]."',".$timestamp.",'".$normalized_timestamp."','".$tweetText."')";
			$insert_retval = mysql_query($insert_query);
			if (!$insert_retval) {
    			die('Could not insert into table: ' . mysql_error());
			}
		}
				
		
		fclose($input_file);
		$sinceidstr= $response['search_metadata']['refresh_url'];
		$sinceidarr = explode("&",$sinceidstr);
		$since_id = explode("=",$sinceidarr[0]);
		$update_query = "update hashtags set since_id='".$since_id[1]."' where university='".$row[1]."'";
		$update_retval = mysql_query($update_query);
		if (!$update_retval) {
    		die('Could not update table: ' . mysql_error());
		}
		$oldPath = getcwd();
		chdir('/home/nisargmodi/git/stress/src/main/python/');
		exec("php php_python_caller.php ".$row[1]);
		chdir('/home/nisargmodi/git/stress/src/main/php/');
		$output_file = fopen("../python/output/".$row[1].".csv","r");
		while(! feof($output_file)) {
			$line = fgets($output_file);
			
			if(strlen($line) != 0) {
				$line_array = explode(",", $line);
				$tweetId = $line_array[0];
				$sentiment = $line_array[2];
				$update_sentiment_query = "update tweets set sentiment='".$sentiment."' where tweetId='".$tweetId."'";
				$update_sentiment_retval = mysql_query($update_sentiment_query);
				if (!$update_sentiment_retval) {
		    		die('Could not update sentiment in table tweets: ' . mysql_error());
				}
			}
  		}
		
	#break;
   }
}
#insert in univ scores
#print_r($university_names);
#the positive and negative scores are not yet normalized
for ($x = 0; $x < count($university_names); $x++) {
    echo "$university_names[$x]";
    $positiveSentiment=0;
    $negativeSentiment=0;
    $all_text ="";
    #for every univ get the positive and negative tweet count
	$select_query_tweets = "select count(sentiment) from tweets where university = \"".$university_names[$x]."\" and sentiment=2";
	$retval = mysql_query($select_query_tweets);
	if (!$retval) {
   		 die('Could not get data: ' . mysql_error());
	} else {
		
    		if($row = mysql_fetch_array($retval)) {
			#echo "***";			
			$negativeSentiment = $row[0];		
		}
	}
	$select_query_tweets = "select count(sentiment) from tweets where university = \"".$university_names[$x]."\" and sentiment=0";
	$retval = mysql_query($select_query_tweets);
	if (!$retval) {
   		 die('Could not get data: ' . mysql_error());
	} else {
		
    		if($row = mysql_fetch_array($retval)) {
			#echo "***";			
			$positiveSentiment = $row[0];		
		}
	}
	#check if university already exists in the table
	$select_query_uniScores = "select * from universityScore where university = \"".$university_names[$x]."\"";
	$retval_uniScores = mysql_query($select_query_uniScores);
	$num_rows = mysql_num_rows($retval_uniScores);
	if ($num_rows<=0) {
		#make a fresh insert
		echo "insert to be performed";
		$insert_query = "insert into universityScore values('".$university_names[$x]."','".$positiveSentiment."',".$negativeSentiment.")";
		$insert_retval = mysql_query($insert_query);
			if (!$insert_retval) {
    				die('Could not insert into table: ' . mysql_error());}
			
   	}
	else{
	#perform an update by adding to previous scores
		$posValueFromTable=0;
		$negValueFromTable=0;		
		if($row = mysql_fetch_array($retval_uniScores)){
			#echo "check:   ".$row[1]."  ".$row[2]."";
			$posValueFromTable=$row[1];
			$negValueFromTable=$row[2];
		}
		$positiveSentiment = $positiveSentiment + $posValueFromTable;
		$negativeSentiment = $negativeSentiment + $negValueFromTable;
		echo "".$negativeSentiment."";		
		echo "update to be performed";
		$update_query = "update universityScore set positiveScore=".$positiveSentiment.", negativeScore=".		  			$negativeSentiment." where university='".$university_names[$x]."'";
		$update_retval = mysql_query($update_query);
		if (!$update_retval) {
		
    		die('Could not update table: ' . mysql_error());
    	}
    }

    ## perform insert in wordcloud table
    $select_query_tweet_text = "select text from tweets where university = \"".$university_names[$x]."\" ORDER BY normalized_timestamp desc LIMIT 1000";
	$retval = mysql_query($select_query_tweet_text);
	while($row = mysql_fetch_array($retval_uniScores)){
			$all_text =$all_text.strtolower($row[1]);
		}
	#process this text
	#remove punctuations
	$all_text = preg_replace('/[^a-z0-9]+/i', ' ', $all_text);
	$all_text = removeCommonWords($all_text);
	$all_text = array_count_values(str_word_count($all_text, 1));
	echo "size of word cloud: ".count($all_text)."\n";		
	arsort($all_text);
	$all_text=array_slice($all_text, 0, (count($all_text) >= 35?35:count($all_text)));
	#$all_text["a"]=5;
	#print_r($all_text);
	#store this in word cloud table
	#word cloud will be based on the most recent tweets
	$delete_query ="delete from wordCloud where tagName = '".$university_names[$x]."'";
	$delete_retval = mysql_query($delete_query);
	if (!$delete_retval) {
    	die('Could not insert into table: ' . mysql_error());
		}
	foreach($all_text as $key=>$option) {
		#echo "".$word."";
		$insert_query = "insert into wordCloud values('".$university_names[$x]."','".$key."','".$option."')";
		$insert_retval = mysql_query($insert_query);
		if (!$insert_retval) {
    		die('Could not insert into table: ' . mysql_error());
		}
	}
			
}
### copying from tweets table to timevis table
	#$tweetsToTimeVisQuery_select = "select university, count(*) as dailyNegativeTweetCount, normalized_timestamp as startTime from tweets where sentiment=2 group by normalized_timestamp, university"
	$tweetsToTimeVisQuery_select = "select university, count(*) as dailyNegativeTweetCount, normalized_timestamp as startTime from tweets where sentiment=2 group by normalized_timestamp, university";
	$tweetsToTimeVisQuery_select_retval = mysql_query($tweetsToTimeVisQuery_select);
	if (!$tweetsToTimeVisQuery_select_retval) {
		die('Could not select from tweets table for timeVis table: ' . mysql_error());
	}
	while($row = mysql_fetch_array($tweetsToTimeVisQuery_select_retval)) {
		$tweetsToTimeVisQuery_insert = "insert into timeVis values ('".$row[0]."',".$row[1].",'".$row[2]."');";
		$tweetsToTimeVisQuery_insert_retval = mysql_query($tweetsToTimeVisQuery_insert);
		if (!$tweetsToTimeVisQuery_insert_retval) {
			die('Could not insert into timeVis table from tweets table: ' . mysql_error());
		}
	}

###insert tweets in word cloud	
?>