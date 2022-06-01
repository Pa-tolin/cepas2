require "test_helper"

class EnologistWinesControllerTest < ActionDispatch::IntegrationTest
  setup do
    @enologist_wine = enologist_wines(:one)
  end

  test "should get index" do
    get enologist_wines_url
    assert_response :success
  end

  test "should get new" do
    get new_enologist_wine_url
    assert_response :success
  end

  test "should create enologist_wine" do
    assert_difference('EnologistWine.count') do
      post enologist_wines_url, params: { enologist_wine: {  } }
    end

    assert_redirected_to enologist_wine_url(EnologistWine.last)
  end

  test "should show enologist_wine" do
    get enologist_wine_url(@enologist_wine)
    assert_response :success
  end

  test "should get edit" do
    get edit_enologist_wine_url(@enologist_wine)
    assert_response :success
  end

  test "should update enologist_wine" do
    patch enologist_wine_url(@enologist_wine), params: { enologist_wine: {  } }
    assert_redirected_to enologist_wine_url(@enologist_wine)
  end

  test "should destroy enologist_wine" do
    assert_difference('EnologistWine.count', -1) do
      delete enologist_wine_url(@enologist_wine)
    end

    assert_redirected_to enologist_wines_url
  end
end
