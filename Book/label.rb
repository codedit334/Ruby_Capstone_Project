class Label
    attr_reader :id, :items
    attr_accessor :title, :color

    def initialize(title, color) do
        @id = rand(1..1000)
        @title = title
        @color = color
        @items = []
    end

    def add_item(item)
        @items.push(item) unless @items.include?(item)
        item.label = self
    end
end

# add_item method in the Label class
# should take an instance of the Item class as an input
# should add the input item to the collection of items
# should add self as a property of the item object (by using the correct setter from the item object)