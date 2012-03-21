require File.dirname(__FILE__) + '/yaml_reader'

WORK_DIRECTORY = "./data/work"

class Work < YAMLReader

  def self.all
    all_files = Dir.glob "#{ WORK_DIRECTORY }/*.yml"
    all_files.map {|path| Work.new path }
  end

end
