class View
	def welcoming
		 puts "Bienvenido a maraton \n te daremos una pregunta y deberas adivinar la respuesta correcta"
	end
	def show(item)
		puts "#{item}"
	end
	def user_input
		answer_user = gets.chomp
		answer_user
	end
	def rigth_or_rong(so)
		puts so == true ? "tu respuesta es CORRECTA" : "tu respuesta es INCORRECTA"
	end
	def veredict(correct,rong)
		puts "Tuviste #{correct} correctas y #{rong} malas"
	end
	def select_deck
		puts "selecciona deck:\n-1. De respuesta unica\n-2. Opcion multiple  "
		selected = gets.chomp
		selected
	end
end
