# frozen_string_literal: true

require './game/game'

describe Game do
  before :each do
    @game = Game.new('2018-02-02', 'Y', last_played_at: '2020-04-02')
  end

  it 'Test for Game instance' do
    expect(@game).to be_instance_of Game
  end

  it 'Test for attribute' do
    expect(@game).to have_attributes(publish_date: Date.parse('2018-02-02'), multiplayer: 'Y',
                                     last_played_at: '2020-04-02')
  end

  it 'Test for can be archive method' do
    expect(@game.send('can_be_archived?')).to be false
  end
end
