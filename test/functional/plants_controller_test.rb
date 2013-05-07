require 'test_helper'

class PlantsControllerTest < ActionController::TestCase
  setup do
    @plant = catalog(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:catalog)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create plant" do
    assert_difference('Plant.count') do
      post :create, plant: { description: @plant.description, height: @plant.height, lat_name: @plant.lat_name, name: @plant.name, plant_type: @plant.plant_type, width: @plant.width }
    end

    assert_redirected_to plant_path(assigns(:plant))
  end

  test "should show plant" do
    get :show, id: @plant
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @plant
    assert_response :success
  end

  test "should update plant" do
    put :update, id: @plant, plant: { description: @plant.description, height: @plant.height, lat_name: @plant.lat_name, name: @plant.name, plant_type: @plant.plant_type, width: @plant.width }
    assert_redirected_to plant_path(assigns(:plant))
  end

  test "should destroy plant" do
    assert_difference('Plant.count', -1) do
      delete :destroy, id: @plant
    end

    assert_redirected_to plants_path
  end
end
