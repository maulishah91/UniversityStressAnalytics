<?php
$university = $argv[1];
echo $university;
chdir('/home/nisargmodi/git/stress/src/main/python/');
exec("python conv_net_model.py input/".$university.".csv output/".$university.".csv");
#python ../python/conv_net_model.py input/UCLA.csv output/UCLA.csv"
?>