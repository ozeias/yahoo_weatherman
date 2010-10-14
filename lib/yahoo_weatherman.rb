path = File.expand_path(File.dirname(__FILE__))
$LOAD_PATH.unshift(path) unless $LOAD_PATH.include?(path)

require 'rubygems'

require 'yaml'
require 'open-uri'
require 'nokogiri'

require 'yahoo_weatherman/i18n'
require 'yahoo_weatherman/image'
require 'yahoo_weatherman/response'
require 'yahoo_weatherman/where'

module Weatherman

  VERSION   = '1.0.3'
  URL       = 'http://weather.yahooapis.com/forecastrss'
  APPID     = 'YahooDemo'
  WHERE_URL = 'http://where.yahooapis.com/geocode'

  # = Client
  #
  # The weatherman client. Where it all begins.
  #
  class Client
    attr_reader :options

    #
    # Accepts a optional hash containing the client options.
    #
    # Options:
    #
    #  +unit+: the unit used for the temperature (defaults to Celsius).
    #  "f" => Fahrenheight
    #  "c" => Celsius
    #
    #  +lang+: the language used in the response
    #
    def initialize(options = {})
      @options = options
      @url = options[:url] || URL
      @appid = options[:appid] || APPID
    end

    #
    # Just pass in a +woeid+ and it will return a Weatherman::Response object:w
    #
    def lookup_by_woeid(woeid)
      raw = get request_url(woeid)
      Response.new(raw, options[:lang])
    end

    def lookup_by_city_and_state(city, state)
      raw = get request_place_finder(city, state)
      Where.new(raw, options[:lang])
    end

    private
      def request_url(woeid)
        @url + query_string(woeid)
      end

      def request_place_finder(city, state)
        WHERE_URL + '?location='+ URI.escape("#{city},+#{state}") + '&appid=' + URI.escape(@appid)
      end

      def query_string(woeid)
        "?w=#{woeid}&u=#{degrees_units}"
      end

      def degrees_units
        (options[:unit] || 'c').downcase
      end

      def get(url)
        open(url) { |stream| stream.read } 
      end
  end
end
