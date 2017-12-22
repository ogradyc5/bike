require 'test_helper'

class StoreCarsControllerTest < ActionController::TestCase
  setup do
    @store_car = store_cars(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:store_cars)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create store_car" do
    assert_difference('StoreCar.count') do
      post :create, store_car: { car_id: @store_car.car_id, store_id: @store_car.store_id }
    end

    assert_redirected_to store_car_path(assigns(:store_car))
  end

  test "should show store_car" do
    get :show, id: @store_car
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @store_car
    assert_response :success
  end

  test "should update store_car" do
    patch :update, id: @store_car, store_car: { car_id: @store_car.car_id, store_id: @store_car.store_id }
    assert_redirected_to store_car_path(assigns(:store_car))
  end

  test "should destroy store_car" do
    assert_difference('StoreCar.count', -1) do
      delete :destroy, id: @store_car
    end

    assert_redirected_to store_cars_path
  end
end
