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

  describe "index" do
    it "returns 200" do
      get "/"
      last_response.status.should == 200
    end
  end

=begin
  describe "work#index" do
    it "returns 200 at /work" do
      get "/work"
      last_response.status.should == 200
    end

    it "returns 200 at /work/" do
      get "/work/"
      last_response.status.should == 200
    end
  end

  describe "work#show" do
    it "returns 200 for a piece" do
      get "/work/mailchimp-redesign"
      last_response.status.should == 200
    end
  end
=end

  describe "site.css" do
    it "returns 200" do
      get "/site.css"
      last_response.status.should == 200
    end
  end

end
