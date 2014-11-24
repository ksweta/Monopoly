require 'rails_helper'

RSpec.describe Gametile, :type => :model do
   let(:game) { Game.create!(status: :initialized, turn: 0) }
   let(:gametile_name) { "chance card" }
   let(:gametile_desc) { "This is chance card" }
   let(:gametile) { game.gametiles.create!(tiletype: :chance, name: gametile_name, game_id: game, description: gametile_desc,
                                           mortgage: 10.00, cost: 200.00, color: :red, position: 10) }

   subject { gametile }
   it { should respond_to(:tiletype) }
   it { should respond_to(:name) }
   it { should respond_to(:game_id) }
   it { should respond_to(:player_id) }
   it { should respond_to(:description) }
   it { should respond_to(:mortgage) }
   it { should respond_to(:cost) }
   it { should respond_to(:color) }
   it { should respond_to(:position) }
   it { should be_valid }

   it "attribute function and their value " do
      expect(gametile.tiletype).to eq("chance")
      expect(gametile.name).to eq(gametile_name)
      expect(gametile.game_id).to eq(game.id)
      expect(gametile.player_id).to be_nil
      expect(gametile.description).to eq(gametile_desc)
      expect(gametile.mortgage).to eq(10.00)
      expect(gametile.cost).to eq(200.00)
      expect(gametile.color).to eq("red")
      expect(gametile.position).to eq(10)
   end

end
