require 'test_helper'

class StaticPagesControllerTest < ActionDispatch::IntegrationTest
  test "should get home" do
    get root
    assert_response :success
    assert_select "title", "Home"|"Habity"
  end
end
