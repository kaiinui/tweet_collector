tweet_collector
===============

Collect tweets to Firebase.

Usage
---

1. `git clone git@github.com:kaiinui/tweet_collector.git`
2. `bundle`
3. Create your Firebase and Twitter app.
4. delete line `config/keys.yml` on `.gitignore`
5. rename `config/keys.yml.example` to `config/keys.yml` and write Twitter App Keys & Firebase Base URI.
6. You can edit words to track at `config/words.yml` (currently tracking "xvideos", "xhamster", everyone would like.)
7. `foreman start worker` to run on local.

You can find collected tweets on your Firebase console.

https://firebase.com/

###Deploy?

Do above and

1. `heroku apps:create`
2. `git push heroku master`
3. `heroku scale worker=1`

Heroku provides us worker instances by free!

Where can I get keys?
---

Go https://apps.twitter.com/ then see

![](https://raw.githubusercontent.com/kaiinui/tweet_collector/master/tweet_collector_SS_1.png)

![](https://raw.githubusercontent.com/kaiinui/tweet_collector/master/tweet_collector_SS_2.png)

LICENSE
---

MIT
