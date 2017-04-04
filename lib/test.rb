require'rest-client'
require 'json'
require 'pry'

def get_character_attribute(character, attribute)
  array = []
  next_page = "http://www.swapi.co/api/people/?page=1"

 while next_page != nil && array == [] do
    all_characters = RestClient.get(next_page)
    character_hash = JSON.parse(all_characters)

   character_hash["results"].each do |item|
      if item["name"].downcase == character
        array = item[attribute]
      end
    end
    next_page = character_hash["next"]
  end
  puts array
end

get_character_attribute ('han solo'),("homeworld")

def url_to_hash(link)
  if link.class == "String"
    film_api = RestClient.get(link)
    film_api_hash = JSON.parse(film_api)
    return film_api_hash
  else
  film_api_array = []
  link.each do |url|
    film_api = RestClient.get(url)
    film_api_hash = JSON.parse(film_api)
    film_api_array << film_api_hash
  end
end
  film_api_array
end
