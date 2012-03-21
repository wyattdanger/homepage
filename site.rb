require 'sinatra/base'
require File.dirname(__FILE__) + '/lib/work'

class PortfolioSite < Sinatra::Base

  set :root, File.dirname(__FILE__)

  get '/' do
    @work = Work.all
    "HELLO"
  end

end
