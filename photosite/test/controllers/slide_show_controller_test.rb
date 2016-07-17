require 'test_helper'

class SlideShowControllerTest < ActionDispatch::IntegrationTest
  test "should get create" do
    get slide_show_create_url
    assert_response :success
  end

end
