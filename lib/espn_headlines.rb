require "open-uri"
require "nokogiri"
require "pry"

require_relative "./espn_headlines/version"
require_relative './espn_headlines/cli'
require_relative './espn_headlines/headline'
require_relative './espn_headlines/scraper'
#acts as environment file
#lets project know of the existance of other files