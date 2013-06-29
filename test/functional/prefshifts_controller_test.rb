require 'test_helper'

class PrefshiftsControllerTest < ActionController::TestCase
  setup do
    @prefshift = prefshifts(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:prefshifts)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create prefshift" do
    assert_difference('Prefshift.count') do
      post :create, prefshift: { cod: @prefshift.cod, descr: @prefshift.descr, fine: @prefshift.fine, inizio: @prefshift.inizio, nome: @prefshift.nome, stato: @prefshift.stato }
    end

    assert_redirected_to prefshift_path(assigns(:prefshift))
  end

  test "should show prefshift" do
    get :show, id: @prefshift
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @prefshift
    assert_response :success
  end

  test "should update prefshift" do
    put :update, id: @prefshift, prefshift: { cod: @prefshift.cod, descr: @prefshift.descr, fine: @prefshift.fine, inizio: @prefshift.inizio, nome: @prefshift.nome, stato: @prefshift.stato }
    assert_redirected_to prefshift_path(assigns(:prefshift))
  end

  test "should destroy prefshift" do
    assert_difference('Prefshift.count', -1) do
      delete :destroy, id: @prefshift
    end

    assert_redirected_to prefshifts_path
  end
end
