require "lita"

module Lita
  module Handlers
    class Xkcd < Handler
      route %r{^xkcd random$}i, :xkcd_random, command: true, help: { "xkcd random" => "A random XKCD comic." }
      route %r{^xkcd ([0-9]+)$}i, :xkcd_num, command: true, help: { "xkcd <num>" => "The XKCD comic <num>" }

      route %r{^xkcd(| latest)$}i, :xkcd_latest, command: true, help: { "xkcd [latest]" => "The latest XKCD comic." }
      

      def xkcd_latest(response)
        resp = http.get('http://xkcd.com/info.0.json')

        raise 'Not found' if resp.status == 404

        response.reply print_comic(MultiJson.load(resp.body))
      rescue
        response.reply error
      end

      def xkcd_num(response)
        comic_num = response.matches[0][0]

        response.reply load_comic(comic_num)
      rescue
        response.reply error
      end

      def xkcd_random(response)
        resp = http.get('http://xkcd.com/info.0.json')

        if resp.status == 200
          obj = MultiJson.load(resp.body)

          comic_num = rand(obj['num'].to_i) + 1
        else
          comic_num = 0
        end

        response.reply load_comic(comic_num)
      rescue
        response.reply error
      end

      private

      def error
        "Sorry, but there was a problem retrieving the comic."
      end

      def load_comic(comic_num)
        resp = http.get("http://xkcd.com/#{comic_num}/info.0.json")

        if resp.status == 404
          response.reply "Comic ##{comic_num} not found."
          return
        end

        print_comic MultiJson.load(resp.body)
      end

      def print_comic(comic)
        ["#{comic['title']}: #{comic['alt']}", comic['img']]
      end


    end

    Lita.register_handler(Xkcd)
  end
end
