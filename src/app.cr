require "kemal"
require "bojack/bojack/client"

get "/" do
  count = client.get("count")

  # yeap, this is bullshit for concurrency, I know
  # For now BoJack doesn't have any "increment" command
  if count
    count = count.to_i
    count += 1
    client.set("count", count)
  end

  "BoJack PageViews: #{count}"
end

def client
  BoJack::Client.new("127.0.0.1", 5000)
end

# BoJack should be running by now
def bootstrap
  client.set("count", 0)
end

bootstrap
Kemal.run
