require 'jruby/jedis'
require 'uri'

class ShardedJedisClient
  
  attr_reader :pool

  def initialize(hosts =[])
    config = Java::OrgApacheCommonsPool2Impl::GenericObjectPoolConfig.new
    config.test_on_borrow = true
    shards = java.util.ArrayList.new
    hosts.each do |host| 
      uri = URI.parse(host)
      shard = Java::RedisClientsJedis::JedisShardInfo.new(uri.host, uri.port)
      if uri.password
        shard.set_password(uri.password)
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
