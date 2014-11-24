require 'rails_helper'

RSpec.describe Player, :type => :model do
      let(:user) { User.create!(email: "test1@example.com", password: "somepassword",  encrypted_password: "somepassword", sign_in_count: 0) }
      let(:game) { Game.create!(status: :initialized, turn: 0) }
      let(:player) { Player.create!(user: user, game: game,  balance: 200.00, position: 0) }

      subject  { player }
      it { should respond_to(:user_id) }
      it { should respond_to(:game_id) }
      it { should respond_to(:balance) }
      it { should respond_to(:position) }
      it { should be_valid }
      it "check attribute accessor and their value" do
         expect(player.balance).to eq(200.00)
         expect(player.position).to eq(0)
         expect(player.user_id).to eq(user.id)
         expect(player.game_id).to eq(game.id)
      end

end
