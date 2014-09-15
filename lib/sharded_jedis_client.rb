require 'jruby/jedis'

#A wrapper around the Redis Jedis client.  The Jedsis client supports sharding.
#
#Example:
#
#
#  hosts = ['qa-cache-mstr-rpt.advertising.aol.com:6310','qa-cache-mstr-rpt.advertising.aol.com:6320','qa-cache-mstr-rpt.advertising.aol.com:6330']
#
#  redis =  ShardedJedisClient.new(hosts)
#
#  redis.get('some_key_271777')
#
class ShardedJedisClient
  
  attr_reader :pool

  def initialize(hosts =[])
    config = Java::OrgApacheCommonsPool2Impl::GenericObjectPoolConfig.new
    config.test_on_borrow = true
    shards = java.util.ArrayList.new
    hosts.each do |host| 
      host,port,password = host.split(':')
      shard = Java::RedisClientsJedis::JedisShardInfo.new(host, port.to_i, password)
      if password
        shard.set_password(password)
      end
      shards << shard
    end
    @pool = Java::RedisClientsJedis::ShardedJedisPool.new(config, shards);
  end

  def method_missing(method, *arguments, &block)
    client = @pool.get_resource
    resp = client.send(method, *arguments, &block)
    @pool.return_resource(client)
    resp
  end
  
end

#ShardedJedisPool pool = new ShardedJedisPool(new Config(), shards);
#ShardedJedis jedis = pool.getResource();
#jedis.set("a", "foo");
#.... // do your work here
#pool.returnResource(jedis);
#.... // a few moments later
#ShardedJedis jedis2 = pool.getResource();
#jedis.set("z", "bar");
#pool.returnResource(jedis);
#pool.destroy()

