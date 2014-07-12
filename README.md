tweet_collector
===============

Collect tweets to Firebase.

Usage
---

1. `git clone git@github.com:kaiinui/tweet_collector.git`
2. `bundle`
3. Create your Firebase and Twitter app.
5. Fill up Twitter App Keys & Firebase Base URI on `config/keys.yml`.
6. Fill up words to track at `config/words.yml`.
7. `foreman start worker` to run on local.

You can find collected tweets on your Firebase console.

https://firebase.com/

###Deploy?

Do above and

1. `heroku apps:create`
2. `git push heroku master`
3. `heroku scale worker=1`
 
or just

`./push`

Heroku provides us worker instances by free!

Where can I get keys?
---

Go https://apps.twitter.com/ then see

![](https://raw.githubusercontent.com/kaiinui/tweet_collector/master/tweet_collector_SS_1.png)

![](https://raw.githubusercontent.com/kaiinui/tweet_collector/master/tweet_collector_SS_2.png)

LICENSE
---

MIT
