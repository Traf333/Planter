require 'test_helper'

class PlantCategoriesControllerTest < ActionController::TestCase
  setup do
    @plant_category = plant_categories(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:plant_categories)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create plant_category" do
    assert_difference('PlantCategory.count') do
      post :create, plant_category: { description: @plant_category.description, lat_name: @plant_category.lat_name, name: @plant_category.name }
    end

    assert_redirected_to plant_category_path(assigns(:plant_category))
  end

  test "should show plant_category" do
    get :show, id: @plant_category
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @plant_category
    assert_response :success
  end

  test "should update plant_category" do
    put :update, id: @plant_category, plant_category: { description: @plant_category.description, lat_name: @plant_category.lat_name, name: @plant_category.name }
    assert_redirected_to plant_category_path(assigns(:plant_category))
  end

  test "should destroy plant_category" do
    assert_difference('PlantCategory.count', -1) do
      delete :destroy, id: @plant_category
    end

    assert_redirected_to plant_categories_path
  end
end
