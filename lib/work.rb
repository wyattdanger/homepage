class Work
  def initialize yaml_data
    yaml_data.each do |key, value|
      self.class.instance_eval do
        attr_accessor :"#{key}"
      end
      self.send "#{key}=".intern, value
    end
  end
end
