module ActsAsCsv
  def self.included(base)
    base.extend ClassMethods
  end
  
  module ClassMethods
    def acts_as_csv
      include InstanceMethods
    end
  end
  
  module InstanceMethods
    def read
      @csv_contents = []
      filename = self.class.to_s.downcase + ".txt"
      file = File.new(filename)
      @headers = file.gets.chomp.split(', ')
      
      file.each do |row|
        @csv_contents << row.chomp.split(', ')
      end
    end
    
    attr_accessor :headers, :csv_contents
    def initialize
      read
    end

    def each
      @csv_contents.each do |contents|
        yield CsvRow.new(Hash[@headers.zip(contents)])
      end
    end
  end
end

class RubyCsv
  include ActsAsCsv
  acts_as_csv
end

class CsvRow
  def initialize(contents)
    @contents = contents
  end

  def method_missing(name, *args)
    @contents[name.to_s]
  end
end

m = RubyCsv.new
m.each {|row| puts row.one}
m.each {|row| puts row.two}
m.each {|row| puts row.three}
m.each {|row| puts row.foobar}