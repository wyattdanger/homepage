require 'haml'
require 'bourbon'
require 'sinatra/base'
require File.dirname(__FILE__) + '/lib/work'
require File.dirname(__FILE__) + '/lib/currently_reading'

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

    def partial filename, locals={}
      haml "_#{filename}".intern, :locals => locals
    end

    def link_to text, url="#", attrs={}
      "<a href='#{url}'>#{text}</a>"
    end
  end

  get '/' do
    @work = Work.all
    @reading = CurrentlyReading.all
    haml :index
  end

=begin
  get '/work/?' do
    @work = Work.all
    haml :work_index
  end

  get '/work/:slug/?' do
    @work = Work.find params[:slug]
    haml :work_show
  end
=end

  get '/site.css' do
    headers 'Content-Type' => 'text/css; charset=utf-8'
    sass :stylesheet
  end

end
