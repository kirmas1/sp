class PageView

  attr_accessor :url, :ip

  def initialize(line)
    args = line.split(' ')
    @url = args[0]
    @ip = args[1]
  end

  def to_s
    "url: #{@url} ip: #{@ip}"
  end
end
