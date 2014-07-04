# encode: utf-8

require 'yaml'
require 'twitter'
require 'firebase'
require_relative 'tweet'

opts = YAML.load_file 'config/keys.yml'

base_uri = opts[:firebase_baseuri]
@firebase = Firebase::Client.new(base_uri)

client = Twitter::Streaming::Client.new do |config|
  config.consumer_key = opts[:twitter_consumer_key]
  config.consumer_secret = opts[:twitter_consumer_secret]
  config.access_token = opts[:twitter_access_token]
  config.access_token_secret = opts[:twitter_access_token_secret]
end

words = YAML.load_file("config/words.yml")
word = words.join(",")

puts "started with #{word}"

client.filter(track: word) do |object|
  tweet = Tweet.new_with_tweet_object(object)
  tweet.save_and_push(@firebase)
end
