require 'test_helper'

class ClotheControllerTest < ActionDispatch::IntegrationTest
  test "should get index" do
    get clothe_index_url
    assert_response :success
  end

end
