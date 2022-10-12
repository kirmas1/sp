
class LogWriter

  def initialize
  end

  def call(counter)
    puts "Ordered by Total visits:\n\n"
    counter.order_by_views.each do |page_counter|
      puts "#{page_counter.url} #{page_counter.total_views} views"
    end
    puts "\nOrdered by Unique visits:\n\n"
    counter.order_unique_by_views.each do |page_counter|
      puts "#{page_counter.url} #{page_counter.unique_views} unique views"
    end
  end
end
