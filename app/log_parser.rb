require './business/model/page_view.rb'
require './business/service/visits_counter'
require './facade/log_writer'
require './facade/local_file_writer'

class LogParser

  def initialize(file_path)
    @file_path = file_path
    @map = {}
  end

  def call
    raise StandardError.new "Error: file doesn't exist" unless File.exist?(@file_path)

    File.readlines(@file_path).each do |line|
      visits_counter.call(PageView.new(line))
    end

    LogWriter.new.call(visits_counter)
    # LocalFileWriter.new(visits_counter)
  end

  def visits_counter
    @counter ||= VisitsCounter.new
  end
end
