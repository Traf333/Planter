require 'test_helper'

class PlantFeaturesControllerTest < ActionController::TestCase
  setup do
    @plant_feature = plant_features(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:plant_features)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create plant_feature" do
    assert_difference('PlantFeature.count') do
      post :create, plant_feature: { name: @plant_feature.name }
    end

    assert_redirected_to plant_feature_path(assigns(:plant_feature))
  end

  test "should show plant_feature" do
    get :show, id: @plant_feature
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @plant_feature
    assert_response :success
  end

  test "should update plant_feature" do
    put :update, id: @plant_feature, plant_feature: { name: @plant_feature.name }
    assert_redirected_to plant_feature_path(assigns(:plant_feature))
  end

  test "should destroy plant_feature" do
    assert_difference('PlantFeature.count', -1) do
      delete :destroy, id: @plant_feature
    end

    assert_redirected_to plant_features_path
  end
end
