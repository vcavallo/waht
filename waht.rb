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

w = Wahtter.new("puts 'a'")
w.to_wahts
a = Wahtter.new(w.wahts_code)

binding.pry
