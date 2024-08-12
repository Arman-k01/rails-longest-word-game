require 'open-uri'

class GamesController < ApplicationController
  def new
    @letters = Array.new(10) { ('A'..'Z').to_a.sample }
  end

  def score
    @letters = params[:letters].split
    @word = params[:word]
    @result = run_game(@word, @letters)

    # Update the session score
    session[:score] ||= 0
    if @result.start_with?("Congratulations")
      session[:score] += @word.length
    end
  end

  private

  def run_game(word, grid)
    if valid_word?(word) && word_in_grid?(word, grid)
      "Congratulations! #{word} is a valid English word and can be built from the grid."
    elsif !word_in_grid?(word, grid)
      "Sorry, but #{word} can't be built out of the grid."
    else
      "Sorry, but #{word} is not a valid English word."
    end
  end

  def word_in_grid?(word, grid)
    word.upcase.chars.all? { |letter| word.upcase.count(letter) <= grid.count(letter) }
  end

  def valid_word?(word)
    url = "https://wagon-dictionary.herokuapp.com/#{word}"
    response = URI.open(url).read
    json = JSON.parse(response)
    json['found']
  rescue OpenURI::HTTPError
    false
  end
end
