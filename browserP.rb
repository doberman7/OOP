#http://www.locomotion.mx
require "nokogiri"
#Net::HTTP provides a rich library which can be used to build HTTP user-agents
require 'net/http'

class Page
  #Recibe una url al crearse.
  def initialize(url)
    #Sends a GET request to the target and returns the HTTP response as a Net::HTTPResponse object.
    #the content of the url is turn intom the  NET object and assign into "res"
    res = Net::HTTP.get_response(URI(url))
    # res is turn into a Nokogiri object, to been able to use nokogiriś methods. for this need to access .body, which need to be a string
    @page = Nokogiri::HTML(res.body.to_s)
  end
  #the fetch methdo puts strings, and methods "title" and "links" outputs
  def fetch!
    puts "Fetching..."
    puts "Título: #{title}" #se imprime e invoca el resultado del metodo "title"
    puts "links "
    puts "#{links}"#se imprime e invoca el resultado del metodo "links"
    puts "url>"
  end

  def links
    ary_wit_liks = []#array donde se igresan los lincks
    #to the Nokogiri Objetc it is aplied  ".css" method, searching the selector".nav-item", then iterate
    #the .css method return a NodeSet, which acts very much like an array, and contains matching nodes from the document.
    @page.css('.nav-item').each do|link|
      #push the concatenation of a :
        #blank space
        #The searching of selector "a", index 0, only the inner_text
        #The searching of selector "a", index 0, only the inner_text and [href] CÓMO FUNCIONA ESTE ULTIMO ES UN MISTERIO???
      ary_wit_liks << "   " + link.css('a')[0].inner_text +  link.css('a')[0]['href']
    end
      ary_wit_liks.join " \n" #The array with the output is joinded in a string and them added a new line
  end

  def title
    #If you know you’re going to get only a single result back, you can use the shortcuts at_css and at_xpath instead of having to access the first element of a NodeSet.
    #search in the Nokogiri Objetc the inner_text of the selector "title"
    @page.at_css('title').inner_text
  end
end
#assign the url put it in the terminal into "url"
url = ARGV
#assign the object Page, which has the parameter "url" joinded into a string
instance = Page.new(url.join)
#aplied the metod fench to the Objetct Page
instance.fetch!
