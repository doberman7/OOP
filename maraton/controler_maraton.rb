require_relative "model_maraton"
require_relative "view_maraton"
require 'faker'
require 'ffaker'

class Controler
  def initialize
    @item = Item.new
    @deck = Deck.new
    @view = View.new
    @view.welcoming
    move_through_the_questions(selection)
    try_again?
  end

  def selection
    deck_selected=@view.select_deck
    @item.file_selector(deck_selected)
  end
  def multiple_resp_option(answer)
    ary = [answer,Faker::Name.name ,FFaker::Airline.flight_number ,FFaker::Food.fruit ]
    ary.shuffle!
  end
  def move_through_the_questions(type_of_deck)
    case type_of_deck
      when "pregs.csv" then question_deck_single_answer
      when "multiple_opt.csv" then question_deck_multiple_answer
    end
  end
  def question_deck_multiple_answer

    item_n = 0
    correct = 0
    rong = 0
    item = get_items(item_n)
    index_correct_answer=nil
    until item == nil
      item = get_items(item_n)
      break if item == nil
      @view.show(item.question)
      multiple_resp_option(item.answer).each.with_index do |option, index|
        index_and_option = "#{index+1}.- #{option}"
        @view.show(index_and_option)
         index_correct_answer = index+1 if option == item.answer
      end
      if index_correct_answer == @view.user_input.to_i
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
  def question_deck_single_answer
    item_n = 0
    correct = 0
    rong = 0
    item = get_items(item_n)
    until item == nil
      item = get_items(item_n)
      break if item == nil
      @view.show(item.question)
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
  def try_again?
    @view.ask
    move_through_the_questions(selection) if @view.user_input=="s"
  end

end

Controler.new
