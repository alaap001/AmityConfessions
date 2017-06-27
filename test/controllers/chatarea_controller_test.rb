require 'test_helper'

class ChatareaControllerTest < ActionDispatch::IntegrationTest
  test "should get index" do
    get chatarea_index_url
    assert_response :success
  end

end
