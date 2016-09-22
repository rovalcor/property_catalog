require 'test_helper'

class PhotosControllerTest < ActionController::TestCase
  setup do
    @photo = photos(:one)
  end

  test "should create photo" do
    assert_difference('Photo.count') do
      post :create, photo: { image: @photo.image }
    end

    assert_redirected_to photo_path(assigns(:photo))
  end

  test "should show photo" do
    get :show, id: @photo
    assert_response :success
  end
  
  test "should order photo" do
    post :update_order, photo_id: @photo, rank_order_position: 0
    assert_response :success
  end

  test "should destroy photo" do
    assert_difference('Photo.count', -1) do
      delete :destroy, id: @photo
    end

    assert_redirected_to edit_property_path(@photo.property)
  end
end
