require 'rubygems'
require './site'

use Rack::Reloader, 1
run PortfolioSite.new
