require './business/service/page_counter'

class VisitsCounter

  def initialize
  end

  def call(page_view)
    map[page_view.url] = PageCounter.new(page_view.url) unless map.key?(page_view.url)
    map[page_view.url].call(page_view)
  end

  def order_by_views
    map.values.sort_by(&:total_views).reverse
  end

  def order_unique_by_views
    map.values.sort_by(&:unique_views).reverse
  end

  def map
    @map ||= {}
  end
end