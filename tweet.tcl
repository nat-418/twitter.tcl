# Code adapted from https://wiki.tcl-lang.org/page/Twitter

source ./oauth.tcl

package require oauth
package require http
package require tls

proc tweet {consumer_key consumer_secret access_token access_token_secret tweet_text} {
    ::http::register https 443 [list ::tls::socket -tls1 1]
    
    oauth secret $consumer_secret
 
    set url https://api.twitter.com/1.1/statuses/update.json

    dict set req oauth_consumer_key $consumer_key
    dict set req oauth_token $access_token
    dict set req status $tweet_text

    set oauth [oauth auth POST $url $req $access_token_secret]

    set tok [http::geturl $url -headers [list Authorization $oauth] \
                               -query [http::formatQuery status $tweet_text]]

    puts [http::code $tok]

    http::cleanup $tok
}
