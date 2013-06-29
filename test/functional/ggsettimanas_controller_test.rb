require 'test_helper'

class GgsettimanasControllerTest < ActionController::TestCase
  setup do
    @ggsettimana = ggsettimanas(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:ggsettimanas)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create ggsettimana" do
    assert_difference('Ggsettimana.count') do
      post :create, ggsettimana: { gg: @ggsettimana.gg }
    end

    assert_redirected_to ggsettimana_path(assigns(:ggsettimana))
  end

  test "should show ggsettimana" do
    get :show, id: @ggsettimana
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @ggsettimana
    assert_response :success
  end

  test "should update ggsettimana" do
    put :update, id: @ggsettimana, ggsettimana: { gg: @ggsettimana.gg }
    assert_redirected_to ggsettimana_path(assigns(:ggsettimana))
  end

  test "should destroy ggsettimana" do
    assert_difference('Ggsettimana.count', -1) do
      delete :destroy, id: @ggsettimana
    end

    assert_redirected_to ggsettimanas_path
  end
end
