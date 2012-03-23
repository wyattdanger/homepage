require 'haml'
require 'bourbon'
require 'sinatra/base'
require File.dirname(__FILE__) + '/lib/work'

class PortfolioSite < Sinatra::Base

  dir = File.dirname(__FILE__)
  set :root, dir
  set :views, :sass => "#{dir}/views/sass", :default => "#{dir}/views"

  helpers do
    def find_template(views, name, engine, &block)
      _, folder = views.detect { |k,v| engine == Tilt[k] }
      folder ||= views[:default]
      super(folder, name, engine, &block)
    end
  end

  get '/' do
    haml :index
  end

  get '/work/?' do
    @work = Work.all
    haml :work
  end

  get '/site.css' do
    headers 'Content-Type' => 'text/css; charset=utf-8'
    sass :stylesheet
  end

end
