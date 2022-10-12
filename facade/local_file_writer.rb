
class LocalFileWriter

  def initialize(counter)
    @counter = counter
  end

  def call
    File.open("output.txt", "w+") do |f|
      f.puts "Ordered by Total visits:\n\n"
      @counter.order_by_views.each do |page_counter|
        f.puts "#{page_counter.url} #{page_counter.total_views} views"
      end
      f.puts "\nOrdered by Unique visits:\n\n"
      @counter.order_unique_by_views.each do |page_counter|
        f.puts "#{page_counter.url} #{page_counter.unique_views} unique views"
      end
    end
  end
end

