require 'sinatra/base'
require 'haml'
require File.dirname(__FILE__) + '/lib/work'

class PortfolioSite < Sinatra::Base

  set :root, File.dirname(__FILE__)
  set :views, File.dirname(__FILE__) + '/views'

  get '/' do
    @work = Work.all
    haml :index
  end

end
