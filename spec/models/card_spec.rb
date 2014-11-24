require 'rails_helper'

RSpec.describe Card, :type => :model do
   let(:card_description) { "Community chest card" }
   let(:game) { Game.create!(status: :initialized, turn: 0) }
   let(:card) { game.cards.create!(cardtype: :communitychest, used: false, description: card_description) }

   subject { card }
   it { should respond_to(:cardtype) }
   it { should respond_to(:used) }
   it { should respond_to(:game_id) }
   it { should respond_to(:description) }
   it { should be_valid }

   it "attribute accessor and their value" do
      expect(card.cardtype).to eq("communitychest")
      expect(card.game_id).to eq(game.id)
      expect(card.used).to eq(false)
      expect(card.description).to eq(card_description)
   end

end
