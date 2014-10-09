# ShardedJedisClient

The ShardedJedisClient is a wrapper around the jedis client.  

## Installation

Add this line to your application's Gemfile:

    source 'http://adsqa.office.aol.com/gems/'
    gem 'sharded_jedis_client'

And then execute:

    $ bundle

Or install it yourself as:
    $ gem sources --add source http://adsqa.office.aol.com/gems/
    $ gem install sharded_jedis_client

## Usage

A wrapper around the Java Jedis client.  The Jedsis client supports sharding.

Example:


  hosts = %w[redis://:pa$$word@m-qa-reportingmstr001.advertising.aol.com:6310 
             redis://:pa$$word@m-qa-reportingmstr001.advertising.aol.com:6320 
             redis://:pa$$word@m-qa-reportingmstr001.advertising.aol.com:6330
            ]

  redis =  ShardedJedisClient.new(hosts)

  redis.get('some_key_271777')

## Contributing

1. Fork it
2. Create your feature branch (`git checkout -b my-new-feature`)
3. Commit your changes (`git commit -am 'Add some feature'`)
4. Push to the branch (`git push origin my-new-feature`)
5. Create new Pull Request
