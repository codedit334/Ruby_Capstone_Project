require './item.rb'

class Book < Item
    attr_accessor :cover_state, :publisher

    def initialize(publisher, cover_state, publish_date, archived) do
        super(publish_date, archived)
        @cover_state = cover_state
        @publisher = publisher
    end

    private

    can_be_archived?() do
        super || cover_state == "bad"
    end
end