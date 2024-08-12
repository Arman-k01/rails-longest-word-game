# app/controllers/games_controller.rb
require 'open-uri'
require 'json'

class GamesController < ApplicationController
  def new
    @letters = Array.new(10) { ('A'..'Z').to_a.sample }
  end

  def score
    @word = params[:word]
    @letters = params[:letters].split
    @included = included?(@word.upcase, @letters)
    @valid = valid_word?(@word)
  end

  private

  def included?(word, letters)
    word.chars.all? { |letter| word.count(letter) <= letters.count(letter) }
  end

  def valid_word?(word)
    url = "https://wagon-dictionary.herokuapp.com/#{word}"
    begin
      response = URI.open(url).read
      json = JSON.parse(response)
      json['found']
    rescue OpenURI::HTTPError => e
      Rails.logger.error "HTTP Error: #{e.message}"
      false
    rescue StandardError => e
      Rails.logger.error "Error: #{e.message}"
      false
    end
  end
end
