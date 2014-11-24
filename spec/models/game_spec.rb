require 'rails_helper'

RSpec.describe Game, :type => :model do
    let(:game) { Game.new(turn: 0, status: :inprogress) }

   subject { game }

   it { should respond_to(:turn) }
   it { should respond_to(:status) }
   it { should be_valid }

   it "check attribute methods and their value" do
      expect(game.turn).to eq(0)
      expect(game.status).to eq("inprogress")
   end
end
