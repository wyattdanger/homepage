require File.dirname(__FILE__) + '/yaml_reader'

WORK_DIRECTORY = "./data/work"

class Work < YAMLReader

  class WorkNotFoundException < Exception; end

  def self._all_files
    Dir.glob "#{ WORK_DIRECTORY }/*.yml"
  end

  def self.all
    all_files = Work._all_files
    all_files.map {|path| Work.new path }
  end

  def self.find slug
    all_files = Work._all_files
    desired_file = all_files.select {|x| Work.new(x).slug == slug }.first
    unless desired_file.nil?
      Work.new desired_file
    else
      raise WorkNotFoundException, "Could not find work with slug #{slug}"
    end
  end

  def slug
    @slug = title.downcase.strip.gsub(' ', '-').gsub(/[^\w-]/, '')
  end

end
