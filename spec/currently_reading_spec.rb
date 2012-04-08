require 'currently_reading'

describe CurrentlyReading do

  before do
    @sample = CurrentlyReading.new
  end

  context "from its yaml file" do
    it "has an array of books" do
      @sample.booklist.class.should eq Array
    end
  end

  context "books" do
    before do
      @booklist = @sample.booklist
    end

    it "has an array of valid books" do
      @booklist.each do |book|
        book.title.should_not be_nil
        book.url.should_not be_nil
      end
    end

  end
end
