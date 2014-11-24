class Card < ActiveRecord::Base
   enum cardtype: [:communitychest, :chancecard]
   belongs_to :game, inverse_of: :cards
   belongs_to :player, inverse_of: :cards

   #Validation
   validates :cardtype, :game_id, presence: true
   validates :used, inclusion: { in: [true, false] }
   validates :used, exclusion: { in: [nil] }
   validates :description, presence: true

end
