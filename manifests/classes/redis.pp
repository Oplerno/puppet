## redis.pp

class { 'redis':
  template_path => 'oplerno_redis/redis.conf.erb'
}
