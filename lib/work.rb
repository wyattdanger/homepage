class Work
  attr_accessor :title

  def initialize yaml_data
    yaml_data.each do |key, value|
      self.send "#{key}=".intern, value
    end
  end
end
