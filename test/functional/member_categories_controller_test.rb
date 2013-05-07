require 'test_helper'

class MemberCategoriesControllerTest < ActionController::TestCase
  setup do
    @member_category = member_categories(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:member_categories)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create member_category" do
    assert_difference('MemberCategory.count') do
      post :create, member_category: { description: @member_category.description, name: @member_category.name }
    end

    assert_redirected_to member_category_path(assigns(:member_category))
  end

  test "should show member_category" do
    get :show, id: @member_category
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @member_category
    assert_response :success
  end

  test "should update member_category" do
    put :update, id: @member_category, member_category: { description: @member_category.description, name: @member_category.name }
    assert_redirected_to member_category_path(assigns(:member_category))
  end

  test "should destroy member_category" do
    assert_difference('MemberCategory.count', -1) do
      delete :destroy, id: @member_category
    end

    assert_redirected_to member_categories_path
  end
end
