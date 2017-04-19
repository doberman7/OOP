require_relative "model_maraton"
require_relative "view_maraton"

class Controler
  def initialize
    @item = Item.new
    @deck = Deck.new
    @view = View.new
    #@view.welcoming
    get_items
  end
  def get_items
    item = @item.get_it(0)
    p item.question
  end

end

Controler.new
