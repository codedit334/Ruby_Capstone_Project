require './item.rb'

class Book < Item
    attr_accessor :cover_state, :publisher
    
    initialize(publisher, cover_state, label, publish_date, archived) do
        super(id, label, publish_date, archived)
        @cover_state = cover_state
        @publisher = publisher
    end

    private

    can_be_archived?() do
        super || cover_state == "bad"
    end
    
end