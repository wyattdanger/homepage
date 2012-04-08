require File.dirname(__FILE__) + '/yaml_reader'

class CurrentlyReading < YAMLReader
  DATA_SOURCE = "./data/reading.yml"

  attr_reader :booklist

  def initialize
    super DATA_SOURCE
    raise "No books provided" if books.nil?
    @booklist ||= books.map {|b| Book.new b }
  end

  class Book < OpenStruct
  end

end
