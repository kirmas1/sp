require 'set'

class PageCounter

  attr_accessor :url, :total_views

  def initialize(url)
    @url = url
    @total_views = 0
  end

  def call(page_view)
    return unless page_view.url == @url
    ips_set.add(page_view.ip)
    @total_views += 1
  end

  def ips_set
    @ips_set ||= Set.new
  end

  def unique_views
    ips_set.size
  end

end