require './item.rb'

class Book < Item
    attr_accessor :cover_state, :publisher

    def initialize(publisher, cover_state, publish_date)
        super(publish_date)
        @cover_state = cover_state
        @publisher = publisher
    end

    def to_h
        {
            publisher: @publisher,
            cover_state: @cover_state,
            publish_date: @publish_date
        }
    end

    private

    def can_be_archived?()
        super() || @cover_state == "bad"
    end
end