class Label
  attr_reader :id, :items
  attr_accessor :title, :color

  def initialize(title, color)
    @id = rand(1..1000)
    @title = title
    @color = color
    @items = []
  end

  def add_item(item)
    @items.push(item) unless @items.include?(item)
    item.label = self
  end

  def to_h
    {
      id: @id,
      title: @title,
      color: @color,
      items: @items.map(&:to_h)
    }
  end
end
