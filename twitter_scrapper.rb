#para activar usar:
#ruby twitter_scrapper.rb https://twitter.com/Doberman_7
require 'open-uri' #webpage is live on a remote site twiter
require 'Nokogiri'
class TwitterScrapper
  def initialize(url)
		@page = Nokogiri::HTML(open(url))
  end

  def extract_username
		profile_name = @page.search(".ProfileHeaderCard-name > a")# El "> a" hacen no visible el espacio de linea en la consola
		"Username: #{profile_name.inner_text}"
  end

  def extract_tweets
		tweet = @page.search(".tweet")# El parametro ".ProfileNav-value"  se obtiene con el inspector de Navegador
		"#{tweet[0].inner_text}"
  end

  def extract_stats
		profile_tweet = @page.search(".ProfileNav-value")# El parametro ".ProfileNav-value"  se obtiene con el inspector de Navegador
		"Tweets: #{profile_tweet[0].inner_text} \nSiguiendo: #{profile_tweet[1].inner_text}\nSeguidores #{profile_tweet[2].inner_text}\nLikes #{profile_tweet[3].inner_text} "
  end

end
url = ARGV
instance = TwitterScrapper.new(url.join)

puts instance.extract_username
puts instance.extract_tweets
puts instance.extract_stats

=begin
$ ruby twitter_scrapper.rb
Username: Chicharito Hernandez
----------------------------------------------------------------------------
Stats: Tweets: 734, Siguiendo: 298, Seguidores: 4,95M, Favoritos: 70
----------------------------------------------------------------------------
Tweets:
30 de mar.: Somos futbolistas unidos por una gran causa. Entendamos juntos al autismo @iluminemosazul https://www.youtube.com/watch?v=g3umuOWdMyA … #Iluminemosdeazul
Retweets:862, Favorites:1,6K

30 de mar.: Felicidades churuuuuuu @SergioRamos que la pases muy bien!!!  #top pic.twitter.com/ulhTMRk38V
Retweets:2,6K, Favorites:5,3K

29 de mar.: Fe y confianza!!!... Muchísimas gracias por el gran apoyo en LA!... #blessed pic.twitter.com/oOiEmYhKQt
Retweets:3,3K, Favorites:7K
=end
