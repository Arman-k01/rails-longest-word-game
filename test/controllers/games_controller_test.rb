# test/controllers/games_controller_test.rb
require 'test_helper'

class GamesControllerTest < ActionDispatch::IntegrationTest
  test "should get new" do
    get new_game_url
    assert_response :success
  end

  test "should get score" do
    post score_game_url, params: { word: 'example', letters: 'A B C D E F G H I J' }
    assert_response :success
  end
end
