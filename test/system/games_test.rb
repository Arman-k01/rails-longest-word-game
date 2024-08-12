require "application_system_test_case"

class GamesTest < ApplicationSystemTestCase
  test "Going to /new gives us a new random grid to play with" do
    visit new_game_url
    assert_selector "li", count: 10
  end

  test "Submitting a word not in the grid shows an error message" do
    visit new_game_url
    fill_in "word", with: "abcdef"
    click_on "Submit"
    assert_text "Sorry, but abcdef can't be built out of the grid."
  end

  test "Submitting a valid but not English word shows an error message" do
    visit new_game_url
    fill_in "word", with: "zzzzzz"
    click_on "Submit"
    assert_text "Sorry, but zzzzzz is not a valid English word."
  end

  test "Submitting a valid English word shows a success message" do
    visit new_game_url
    fill_in "word", with: "VIM" # Ensure "VIM" is a valid English word
    click_on "Submit"
    assert_text "Congratulations! VIM is a valid English word and can be built from the grid."
  end
end
