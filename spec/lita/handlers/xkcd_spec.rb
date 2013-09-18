require "spec_helper"

describe Lita::Handlers::Xkcd, lita_handler: true do
  it { routes_command("xkcd").to(:xkcd_latest) }
  it { routes_command("xkcd latest").to(:xkcd_latest) }

  it { routes_command("xkcd 123").to(:xkcd_num) }
  it { doesnt_route_command("xkcd 123").to(:xkcd_latest) }

  it { routes_command("xkcd random").to(:xkcd_random) }
  it { doesnt_route_command("xkcd random").to(:xkcd_latest) }

  it { doesnt_route_command("help xkcd").to(:xkcd_latest) }
end
