require 'test_helper'

class ParkingSpotsControllerTest < ActionDispatch::IntegrationTest
  test "should get index" do
    get parking_spots_index_url
    assert_response :success
  end

  test "should get new" do
    get parking_spots_new_url
    assert_response :success
  end

  test "should get create" do
    get parking_spots_create_url
    assert_response :success
  end

  test "should get edit" do
    get parking_spots_edit_url
    assert_response :success
  end

  test "should get update" do
    get parking_spots_update_url
    assert_response :success
  end

  test "should get destroy" do
    get parking_spots_destroy_url
    assert_response :success
  end

end
