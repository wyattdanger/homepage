require 'work'

describe Work do

  before do
    @sample = Work.new "./spec/fixtures/work_sample.yml"
  end

  context "from its yaml file" do
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

  context "self.all" do

    before do
      @works = Work.all
    end

    it "fetches all work samples" do
      @works.should_not be_nil
    end

    it "returns an array" do
      @works.class.should be Array
    end

    it "returns an array containing instantited Work objects" do
      @works.first.class.should be Work
    end
  end

  context "slug" do
    it "has a slug" do
      @sample.slug.should eq "work-sample"
    end
  end

  context "self.find" do
    it "returns a work item by slug" do
      Work.find('mailchimp-redesign').should be_a Work
    end

    it "returns a work item by slug" do
      Work.find('mailchimp-redesign').title.should eq "MailChimp Redesign"
    end

    it "throws an error if no work found" do
      lambda { 
        Work.find('comcast-redesign')
      }.should raise_error Work::WorkNotFoundException
    end
  end

end
