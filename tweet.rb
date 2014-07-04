class Tweet
  attr_accessor :text, :user_name, :user_id, :user_follower, :user_created_at, :created_at, :lang, :urls, :hashtags

  def self.new_with_tweet_object(object)
    hash = object.to_h
    tweet = new
    tweet.text = hash[:text]
    tweet.urls = hash[:entities][:urls].map {|url| url[:expanded_url]} if hash[:entities][:urls]
    tweet.hashtags = hash[:entities][:hashtags].map {|hashtag| hashtag[:text]} if hash[:entities] and hash[:entities][:hashtags]
    tweet.user_name = hash[:user][:name]
    tweet.user_id = hash[:user][:screen_name]
    tweet.user_follower = hash[:user][:followers_count]
    tweet.user_created_at = hash[:user][:created_at]
    tweet.created_at = hash[:created_at]
    tweet.lang = hash[:lang]
    tweet
  end

  def to_h
    hash = {}
    [:text, :user_name, :user_id, :user_follower, :user_created_at, :created_at, :lang, :hashtags, :urls].each do |attr|
      hash[attr] = self.send(attr)
    end
    hash
  end

  def save_and_push(firebase)
    puts self.text
    response = firebase.push("tweets", self.to_h)
  rescue
  end
end