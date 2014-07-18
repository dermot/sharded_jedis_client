# ShardedJedisClient

The ShardedJedisClient is a wrapper around the jedis client.  

## Installation

Add this line to your application's Gemfile:

    gem 'sharded_jedis_client'

And then execute:

    $ bundle

Or install it yourself as:

    $ gem install sharded_jedis_client

## Usage

A wrapper around the Redis Jedis client.  The Jedsis client supports sharding.

Example:


  hosts = ['qa-cache-mstr-rpt.advertising.aol.com:6310','qa-cache-mstr-rpt.advertising.aol.com:6320','qa-cache-mstr-rpt.advertising.aol.com:6330']

  redis =  ShardedJedisClient.new(hosts)

  redis.get('some_key_271777')

## Contributing

1. Fork it
2. Create your feature branch (`git checkout -b my-new-feature`)
3. Commit your changes (`git commit -am 'Add some feature'`)
4. Push to the branch (`git push origin my-new-feature`)
5. Create new Pull Request
