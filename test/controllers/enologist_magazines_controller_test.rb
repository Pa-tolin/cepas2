require "test_helper"

class EnologistMagazinesControllerTest < ActionDispatch::IntegrationTest
  setup do
    @enologist_magazine = enologist_magazines(:one)
  end

  test "should get index" do
    get enologist_magazines_url
    assert_response :success
  end

  test "should get new" do
    get new_enologist_magazine_url
    assert_response :success
  end

  test "should create enologist_magazine" do
    assert_difference('EnologistMagazine.count') do
      post enologist_magazines_url, params: { enologist_magazine: {  } }
    end

    assert_redirected_to enologist_magazine_url(EnologistMagazine.last)
  end

  test "should show enologist_magazine" do
    get enologist_magazine_url(@enologist_magazine)
    assert_response :success
  end

  test "should get edit" do
    get edit_enologist_magazine_url(@enologist_magazine)
    assert_response :success
  end

  test "should update enologist_magazine" do
    patch enologist_magazine_url(@enologist_magazine), params: { enologist_magazine: {  } }
    assert_redirected_to enologist_magazine_url(@enologist_magazine)
  end

  test "should destroy enologist_magazine" do
    assert_difference('EnologistMagazine.count', -1) do
      delete enologist_magazine_url(@enologist_magazine)
    end

    assert_redirected_to enologist_magazines_url
  end
end
