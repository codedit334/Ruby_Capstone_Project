require './item.rb'

class Book < Item
    initialize(publisher, cover_state, label, publish_date, archived) do
        super(label, publish_date, archived)
        @cover_state = cover_state
        @publisher = publisher
    end
end