require "application_system_test_case"

class GamesTest < ApplicationSystemTestCase
    test "Going to /new gives us a new random grid to play with" do
      visit new_url
      assert test: "New game"
      assert_selector "li", count: 10
    end

    # test "Posting to /score a real word gives numeric score" do
    #   visit post_url
    #   assert test: "Check score"
    #   assert_selector "li", count: 10
    # end

  # test "visiting the index" do
  #   visit games_url
  #
  #   assert_selector "h1", text: "Game"
  # end
end