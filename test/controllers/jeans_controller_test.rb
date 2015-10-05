require 'test_helper'

class JeansControllerTest < ActionController::TestCase
  setup do
    @jeans = jeans(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:jeans)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create jeans" do
    assert_difference('Jeans.count') do
      post :create, jeans: { color: @jeans.color, denim: @jeans.denim, maker: @jeans.maker }
    end

    assert_redirected_to jeans_path(assigns(:jeans))
  end

  test "should show jeans" do
    get :show, id: @jeans
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @jeans
    assert_response :success
  end

  test "should update jeans" do
    patch :update, id: @jeans, jeans: { color: @jeans.color, denim: @jeans.denim, maker: @jeans.maker }
    assert_redirected_to jeans_path(assigns(:jeans))
  end

  test "should destroy jeans" do
    assert_difference('Jeans.count', -1) do
      delete :destroy, id: @jeans
    end

    assert_redirected_to jeans_index_path
  end
end
