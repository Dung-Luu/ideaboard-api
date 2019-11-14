require 'test_helper'

class Api::V1::IdeasControllerTest < ActionDispatch::IntegrationTest
  test "should get index" do
    get api_v1_ideas_index_url
    assert_response :success
  end

end
