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

  get '/site.css' do
    headers 'Content-Type' => 'text/css; charset=utf-8'
    sass :stylesheet
  end

end
