if Rails.env.production?
  uri = URI.parse(ENV["REDISTOGO_URL"])
else
  uri = URI.parse(ENV["DEVOCLOCK_REDIS_TOGO_URL"])
end
$redis = Redis.new(:url => uri)
