class Game < ActiveRecord::Base
   enum status: [:initialized, :invited, :inprogress, :completed]
   has_many :players, inverse_of: :game
   has_many :users, through: :player
   has_many :gametiles, inverse_of: :game
   has_many :cards, inverse_of: :game

   #Validation
   validates :status, presence: true
   validates :turn,  numericality: { only_integer: true }
   # validates :players, numericality: {only_integer: true}, presence: true

end
