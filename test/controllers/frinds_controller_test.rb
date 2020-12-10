require 'test_helper'

class FrindsControllerTest < ActionDispatch::IntegrationTest
  setup do
    @frind = frinds(:one)
  end

  test "should get index" do
    get frinds_url
    assert_response :success
  end

  test "should get new" do
    get new_frind_url
    assert_response :success
  end

  test "should create frind" do
    assert_difference('Frind.count') do
      post frinds_url, params: { frind: { email: @frind.email, first_name: @frind.first_name, last_name: @frind.last_name, phone: @frind.phone } }
    end

    assert_redirected_to frind_url(Frind.last)
  end

  test "should show frind" do
    get frind_url(@frind)
    assert_response :success
  end

  test "should get edit" do
    get edit_frind_url(@frind)
    assert_response :success
  end

  test "should update frind" do
    patch frind_url(@frind), params: { frind: { email: @frind.email, first_name: @frind.first_name, last_name: @frind.last_name, phone: @frind.phone } }
    assert_redirected_to frind_url(@frind)
  end

  test "should destroy frind" do
    assert_difference('Frind.count', -1) do
      delete frind_url(@frind)
    end

    assert_redirected_to frinds_url
  end
end
