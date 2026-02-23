require "open-uri"

class GamesController < ApplicationController
  def new
    @alphabet = ("A".."Z").to_a
    @letters = @alphabet.sample(10)
  end

  def score
    @word = params[:word]
    @letters = params[:letters]
    # si reponse include? pas les lettres -> afficher "sorry but "your word" can't be built out of "list-alpphabet"

    @grid_presence = @word.chars.all? do |letter|
      @letters.include?(letter)
    end


    url = "https://dictionary.lewagon.com/#{@word}"
    @api_response = JSON.parse(URI.parse(url).read)

    # si reponse include? pas l'api -> afficher "sorry but "your word" doesn't seem to be a valid english word"
    # si lettres include letters & api -> afficher "congratulations! "your word" is a valid word"
  end
end
