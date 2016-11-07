uri = URI.parse(ENV["DEVOCLOCK_REDIS_TOGO_URL"])
$redis = Redis.new(:url => uri)
