require 'test_helper'

class GoogleControllerTest < ActionDispatch::IntegrationTest
  test "should get getPlaces" do
    get google_getPlaces_url
    assert_response :success
  end

end
