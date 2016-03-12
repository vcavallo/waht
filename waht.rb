require 'pry'

class Wahtter
  attr_reader :source_code
  attr_reader :wahts_code

  def initialize(input)
    @input = input
    @source_code = ""
    @wahts_code = ""
  end

  def to_source_code
    @source_code = @input.split("waht").collect { |dots| dots.size.chr }.join
  end

  def to_wahts
    @wahts_code = ""
    @input.split('').collect do |c|
      c.bytes.first.times do
        @wahts_code << "."
      end
      @wahts_code << "waht"
    end
  end

end

#w = Wahtter.new("puts 'a'")
#w.to_wahts
#a = Wahtter.new(w.wahts_code)

class WahtPreparer
  attr_reader :wahts_code
  def initialize(ruby_file)
    @file = ruby_file
  end

  def to_wahts
    string = ""
    File.read(@file).split('').collect do |c|
      c.bytes.first.times do
        string << "."
      end
      string << "waht"
    end
    @wahts_code = string
  end

  def create_waht_file
    File.open("waht.waht", "w") { |f| f.write(to_wahts) }
  end

end

binding.pry
