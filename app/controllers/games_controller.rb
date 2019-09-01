require 'open-uri'

class GamesController < ApplicationController
  def new
    @letters = generate_grid
  end

  def score
    contains_all = true
    params[:word].length.times do |i|
      contains_all = false unless params[:letters].include?(params[:word][i])
    end
    response = "https://wagon-dictionary.herokuapp.com/"
    response = response << params[:word]
    response = open(response).read
    response = JSON.parse(response)
    (response["found"] && contains_all) ? @score = response["length"] : @score = "0 (word is invalid)"
  end

  def generate_grid
    letters = %w[a b c d e f g h i j k l m n o p q r s t u v w x y z]
    grid = []
    10.times do
      grid << letters.sample
    end
    grid
  end
end

# url = "#{url}/#{arg}"
# dictionary_response_html = open(url).read
# JSON.parse(dictionary_response_html)