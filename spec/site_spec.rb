require File.dirname(__FILE__) + '/../site.rb'

require 'rack/test'

# set test environment
Sinatra::Base.set :environment, :test
Sinatra::Base.set :run, false
Sinatra::Base.set :raise_errors, true
Sinatra::Base.set :logging, false

describe PortfolioSite do
  include Rack::Test::Methods

  def app
    PortfolioSite.new
  end

  it "says hello" do
    get "/"
    last_response.status.should == 200
  end

end
