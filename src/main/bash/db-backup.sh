#!/bin/bash
mysqldump -u root stressAnalytics > /home/ubuntu/desktop/stress/src/main/sql/back.sql
cd /home/ubuntu/desktop/stress/
git add -A
git commit -m "db backup"
git push
