require "kemal"
require "bojack/bojack/server"
require "bojack/bojack/client"

get "/" do
  count = client.increment("count") || 0

  "BoJack PageViews: #{count.to_s}"
end

def client
  BoJack::Client.new("127.0.0.1", 5000)
end

def bootstrap
  # Server
  spawn do
    BoJack::Server.new("127.0.0.1", 5000).start
  end
  sleep 1
  client.set("count", 0)
end

bootstrap
Kemal.run
