require 'test_helper'

class PairingsControllerTest < ActionDispatch::IntegrationTest
  test "should get index" do
    get pairings_index_url
    assert_response :success
  end

  test "should get generate" do
    get pairings_generate_url
    assert_response :success
  end

end
