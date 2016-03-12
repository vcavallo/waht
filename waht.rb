class WahtParser
  attr_reader :source_code
  def initialize(waht_file)
    @file = waht_file
  end

  def to_source_code
    @source_code = File.read(@file).split("waht").collect do |dots|
      dots.size.chr 
    end.join
  end
end

class WahtRunner
  def initialize(source_code)
    @code = source_code
  end

  def run
    eval(@code)
  end
end

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
