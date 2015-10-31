require 'test_helper'

class GyrosControllerTest < ActionController::TestCase
  setup do
    @gyro = gyros(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:gyros)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create gyro" do
    assert_difference('Gyro.count') do
      post :create, gyro: { tomato: @gyro.tomato, type: @gyro.type, user_id: @gyro.user_id }
    end

    assert_redirected_to gyro_path(assigns(:gyro))
  end

  test "should show gyro" do
    get :show, id: @gyro
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @gyro
    assert_response :success
  end

  test "should update gyro" do
    patch :update, id: @gyro, gyro: { tomato: @gyro.tomato, type: @gyro.type, user_id: @gyro.user_id }
    assert_redirected_to gyro_path(assigns(:gyro))
  end

  test "should destroy gyro" do
    assert_difference('Gyro.count', -1) do
      delete :destroy, id: @gyro
    end

    assert_redirected_to gyros_path
  end
end
