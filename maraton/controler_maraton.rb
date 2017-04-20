require_relative "model_maraton"
require_relative "view_maraton"
require 'faker'

class Controler
  def initialize
    @item = Item.new
    @deck = Deck.new
    @view = View.new
    #@view.welcoming
    #selection
    move_through_the_questions(selection)
  end

  def selection
    deck_selected=@view.select_deck
    @item.file_selector(deck_selected)
  end
  def multiple_resp_option(answer)
    ary = [answer,Faker::ChuckNorris.fact,Faker::File.extension,Faker::Job.field]
    ary.shuffle!
     @view.show("1 "+ary[0])
     @view.show("2 "+ary[1])
     @view.show("3 "+ary[2])
     @view.show("4 "+ary[3])
  end
  def move_through_the_questions(type_of_deck)
    item_n = 0
    correct = 0
    rong = 0
    item = get_items(item_n)
    until item == nil
      item = get_items(item_n)
      break if item == nil
      @view.show(item.question)
      multiple_resp_option(item.answer) if type_of_deck == "multiple_opt.csv"
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
