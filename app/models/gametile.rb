class Gametile < ActiveRecord::Base
   enum tiletype: [:chance, :communitychest, :jail, :go, :goto,  :parking, :property, :railraod, :tax, :utility]
   enum color: [:blue, :brown, :green, :orange, :pink, :red, :skyblue, :yellow]
   belongs_to :game, inverse_of: :gametiles
   belongs_to :player, inverse_of: :gametiles

   #validation
   validates :tiletype, :name, :game_id, :description, presence: true
   validates :mortgage, :cost, numericality: true
   validates :color, presence: true
   validates :position, numericality: { only_integer: true }

end
