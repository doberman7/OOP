#para activar usar:
#ruby twitter_scrapper.rb https://twitter.com/Doberman_7
require 'open-uri'
 #webpage is live on a remote site twiter
require 'nokogiri'#Esta es la biblioteca para interactuar con un HTML
class TwitterScrapper
  def initialize(url)#initializar el parametro "url"
		@page = Nokogiri::HTML(open(url))# el url es convertido en un una instance_var del objeto TwitterScrapper
  end

  def extract_username
    #buscar en la variables de instancia 
		profile_name = @page.search(".ProfileHeaderCard-name > a")# El "> a" hacen no visible el espacio de linea en la consola
		puts "Username: #{profile_name.inner_text}"#imprimir la el
    puts "-" * 60
  end

  def extract_tweets
		tweet = @page.search(".js-tweet-text-container")# El parametro ".ProfileNav-value"  se obtiene con el inspector de Navegador
    date = @page.search("._timestamp")

    counter = 0
    puts"Tweets:"
      tweet.first(2).each do |t|
        date.first(2).each do |d|
            puts " #{d.inner_text}:#{t.inner_text.strip}"
            resp = @page.search(".ProfileTweet-actionCount")[counter].inner_text.strip#8
            reTweet = @page.search(".ProfileTweet-actionCount")[counter+=1].inner_text.strip#9
            likes = @page.search(".ProfileTweet-actionCount")[counter+=1].inner_text.strip#10
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
