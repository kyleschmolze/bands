# Bands
Let's keep track of our favorite bands with a helpful Ruby `Band` class!

Our `Band` class lives in `band.rb`. Our tests live in `spec/band_spec.rb`.
Run the tests by simply entering `rspec` on the command line.
You should have 1 passing test, and 3 failing tests.

Step 0: Jump into a ruby console with `pry`. Start with `require './band'`, then try messing around with the `Band` class: 
```
b = Band.new
b.name = "The Beatles"
b.name # "The Beatles"
```

Step 1: Fix the second test so it passes by adding Ringo to the band. Can you think of more than one way to do this?

Step 2: Define the `:capitalized_members` method in `band.rb` so that the relevant test passes.

Step 3: Use the public API from TheAudioDB.com to lookup the list of albums for any given band!

First, read the documentation on [TheAudioDB.com's API here](https://www.theaudiodb.com/api_guide.php).
We'll be using the `discography.php` endpoint.
Here's an example GET request you can send to this endpoint: (just paste this into your browser):

```
https://theaudiodb.com/api/v1/json/2/discography.php?s=the%20beatles
```

To make an API request in Ruby, you can either use the (confusing) built in Ruby methods, or you can use a nifty library like [HTTParty](https://github.com/jnunemaker/httparty)!

1. Read the HTTParty README.
2. Install HTTParty with `gem install httparty`.
3. Add `require 'httparty'` to the top of `band.rb`.
4. Write a `:albums` method for `band.rb`, which makes the API call using HTTParty and returns this list of albums.

Bonus: Instead of returning the exact API response from TheAudioDB (with album names and the year they were released), manipulate your response first so that the `:albums` method only returns an array of the titles of the albums only.

Double bonus: What happens if the band name is total jibberish (e.g. "jifes93svidl")? Can your method return some intelligent response when the API call "fails"?

Triple bonus: Add two optional arguments to `:albums` which allow you to specify a starting year and/or an ending year. Only return the titles of albums which were published in that year.

Home run: Write a test or two for the `:albums` method.
