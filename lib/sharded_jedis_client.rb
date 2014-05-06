require 'delegate'
require 'jedis-2.1.0.jar'

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
