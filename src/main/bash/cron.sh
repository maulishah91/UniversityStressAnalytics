#! /bin/bash

cd /home/ubuntu/desktop/stress/src/main/php/
php fetch-tweets.php >> /home/ubuntu/desktop/stress/src/main/bash/logs/$(date +%Y%m%d_%H%M%S%Z).log

