require 'test_helper'

class AboutAmitiansControllerTest < ActionDispatch::IntegrationTest
  test "should get new" do
    get about_amitians_new_url
    assert_response :success
  end

end
