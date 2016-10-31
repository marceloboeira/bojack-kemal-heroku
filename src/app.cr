require "kemal"
require "bojack/bojack/server"
require "bojack-client/bojack-client"
require "secure_random"

get "/new/:url" do |env|
  url = URI.unescape(env.params.url["url"])
  short = SecureRandom.hex[0..6]

  client.set(short, url)

  "New URL #{url} -> /#{short}"
end

get "/:key" do |env|
  key = env.params.url["key"]
  url = client.get(key) || "https://github.com"

  env.redirect(url.tr("\n", ""))
end

def client
  BoJack::Client.new("127.0.0.1", 5000)
end

def bootstrap
  spawn do
    BoJack::Server.new("127.0.0.1", 5000).start
  end
  sleep 1
end

bootstrap
Kemal.run
