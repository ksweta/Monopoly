class Player < ActiveRecord::Base
   belongs_to :user, inverse_of: :players
   belongs_to :game, inverse_of: :players
   has_many :gametiles, inverse_of: :player

   #Validation
   validates :game, :user, :balance,  presence: true
   validates :balance, numericality: true
   validates :position, numericality: { only_integer: true }
end
