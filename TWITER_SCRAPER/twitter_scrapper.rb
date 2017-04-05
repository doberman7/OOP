#para activar usar:
#ruby twitter_scrapper.rb https://twitter.com/Doberman_7
require 'open-uri'
 #webpage is live on a remote site twiter
require 'nokogiri'#Esta es la biblioteca para interactuar con un HTML
class TwitterScrapper
  def initialize(url)#initializar el parametro "url"
    # asignr, fetch and parse HTML document
		@page = Nokogiri::HTML(open(url))# el url es convertido en un una instance_var del objeto TwitterScrapper
  end

  def extract_username
    #  @page aplicar metodo de nokogiri ".search" , el parametro buscado es el selector ".ProfileHeaderCard-name", el cual se encontró usaando el selector
		profile_name = @page.search(".ProfileHeaderCard-name > a")# El "> a" hacen no visible el espacio de linea en la consola
    #imprimir resultado busqueda, aplicar mentodo de nokogiri ".inner_text"
		puts "Username: #{profile_name.inner_text}"#Get the inner text of all contained Node objects.
    puts "-" * 60
  end

  def extract_tweets
		tweet = @page.search(".js-tweet-text-container")# El parametro ".ProfileNav-value"  se obtiene con el inspector de Navegador
    date = @page.search("._timestamp")#asign the result oif search "._timestamp" selector

    counter = 0#contador para seleccionar elementos [resp, resTweet,likes] los cuales estan dentro del selector ".ProfileTweet-actionCount"
    puts"Tweets:"
      tweet.first(2).each do |t|#iterar en ".js-tweet-text-container", bring only the two first elements
        date.first(2).each do |d|#iterar en "._timestamp", bring only the two first elements
            puts " #{d.inner_text}:#{t.inner_text.strip}"#imprimier text dela fecha y tweet
            #asignar resultado de busqueda en selector con indice[0] en 1 era iteracion, en la suguiente iteracion counter = 8
            resp = @page.search(".ProfileTweet-actionCount")[counter].inner_text.strip#
            #asignar resultado de busqueda en selector con indice[1] en 1 era iteracion, en la suguiente iteracion counter = 9
            reTweet = @page.search(".ProfileTweet-actionCount")[counter+=1].inner_text.strip#
            #asignar resultado de busqueda en selector con indice[2] en 1 era iteracion, en la suguiente iteracion counter = 10
            likes = @page.search(".ProfileTweet-actionCount")[counter+=1].inner_text.strip#
            puts resp
            puts reTweet
            puts likes
            counter += 6
            puts "-" * 50
            break
        end
      end
  end

  def extract_stats
		profile_tweet = @page.search(".ProfileNav-value")# El parametro ".ProfileNav-value"  se obtiene con el inspector de Navegador
    puts "Tweets: #{profile_tweet[0].inner_text} Siguiendo: #{profile_tweet[1].inner_text} Seguidores #{profile_tweet[2].inner_text} Likes #{profile_tweet[3].inner_text} "
    puts "-" * 50
  end

end
url = ARGV
instance = TwitterScrapper.new(url.join)

instance.extract_username
instance.extract_stats
instance.extract_tweets
