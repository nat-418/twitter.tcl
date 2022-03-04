source ./secrets.tcl
source ./tweet.tcl

set timestamp [clock format [clock seconds]]

set tweet_text "test tweet $timestamp"

tweet $consumer_key $consumer_secret $access_token $access_token_secret $tweet_text
