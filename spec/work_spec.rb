require 'work'

describe Work do

  before do
    @data = YAML.load_file "./spec/fixtures/work_sample.yml"
    @sample = Work.new @data
  end

  context "from its configuration" do
    it "fetches its title" do
      @sample.title.should_not be_nil
    end
    it "fetches its description" do
      @sample.description.should_not be_nil
    end
  end

end
