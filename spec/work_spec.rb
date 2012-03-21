require 'work'

describe Work do

  before do
    @sample = Work.new "./spec/fixtures/work_sample.yml"
  end

  context "from its configuration" do
    it "fetches its title" do
      @sample.title.should_not be_nil
    end
    it "fetches its description" do
      @sample.description.should_not be_nil
    end
    it "fetches an array of roles" do
      @sample.roles.class.should be Array
    end
  end

end
