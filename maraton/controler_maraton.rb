require_relative "model_maraton"
require_relative "view_maraton"

class Controler
  def initialize
    @item = Item.new
    @deck = Deck.new
    @view = View.new
    #@view.welcoming
    move_through_the_questions
  end
  def move_through_the_questions
    item_n = 0
    correct = 0
    rong = 0
    while item_n <= 15
      item = get_items(item_n)
      @view.show(item.question)
      @view.show(item.answer)
      if item.answer == @view.user_input
        @view.rigth_or_rong(true)
        correct += 1
      else
        @view.rigth_or_rong(false) ;
        rong += 1
      end
      item_n += 1
    end
    @view.veredict(correct,rong)
  end

  def get_items(n)
    @item.get_it(n)
  end

end

Controler.new
