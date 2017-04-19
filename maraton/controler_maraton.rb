require_relative "model_maraton"
require_relative "view_maraton"

class Controler
 def initialize
  @item = Item.new
  @deck = Deck.new
  @view = View.new
  #@view.welcoming
  @item.get_item
 end

end

Controler.new
