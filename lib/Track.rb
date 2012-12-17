
class Track
  
  ATTRIBUTE_REGEXP = Regexp.compile(/\<key\>(.*)\<\/key\>(.*)/)
  attr_reader :attributes
  
  def initialize string
    @attributes = {}
    parse string
  end
  
  def parse string
    string_list = string.split("\n")
    string_list[2..-2].each do |line|
      #puts "line = #{line.inspect}"
      matches = ATTRIBUTE_REGEXP.match(line)
      if matches && matches.size == 3
        @attributes[matches[1].to_sym] = matches[2]
      else
        puts "Error: bad match: #{matches.inspect} for line: #{line}"
      end
    end
  end
  
  def hashkey  
  "#{@attributes[:Name]},#{@attributes[:Artist]},#{@attributes[:Album]},#{@attributes["Total Time".to_sym]}"
  end
end
