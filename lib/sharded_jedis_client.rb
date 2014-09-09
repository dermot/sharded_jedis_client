require 'delegate'
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
class ShardedJedisClient < SimpleDelegator
  def initialize(hosts =[])
    super
    shards = java.util.ArrayList.new
    hosts.map{|h| h.split(':')}.each do |host,port|
      shards << Java::RedisClientsJedis::JedisShardInfo.new(host, port.to_i)
    end
    @redis = Java::RedisClientsJedis::ShardedJedis.new(shards)
    __setobj__(@redis)
  end
end
