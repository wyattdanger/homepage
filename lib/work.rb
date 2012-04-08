require File.dirname(__FILE__) + '/yaml_reader'

class Work < YAMLReader

  WORK_DIRECTORY = "./data/work"
  IMAGE_PREFIX = "/images/"

  class WorkNotFoundException < Exception; end

  def self.all
    all_files.map {|path| Work.new path }
  end

  def self.find slug
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

  def image_url
    IMAGE_PREFIX + image
  end

  private

  def self.all_files
    @all_files ||= Dir.glob("#{ WORK_DIRECTORY }/*.yml").sort
  end

end
