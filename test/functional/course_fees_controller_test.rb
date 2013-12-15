require 'test_helper'

class CourseFeesControllerTest < ActionController::TestCase
  setup do
    @course_fee = course_fees(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:course_fees)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create course_fee" do
    assert_difference('CourseFee.count') do
      post :create, course_fee: { amount: @course_fee.amount, course_id: @course_fee.course_id, cycle: @course_fee.cycle, description: @course_fee.description, fee_id: @course_fee.fee_id }
    end

    assert_redirected_to course_fee_path(assigns(:course_fee))
  end

  test "should show course_fee" do
    get :show, id: @course_fee
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @course_fee
    assert_response :success
  end

  test "should update course_fee" do
    put :update, id: @course_fee, course_fee: { amount: @course_fee.amount, course_id: @course_fee.course_id, cycle: @course_fee.cycle, description: @course_fee.description, fee_id: @course_fee.fee_id }
    assert_redirected_to course_fee_path(assigns(:course_fee))
  end

  test "should destroy course_fee" do
    assert_difference('CourseFee.count', -1) do
      delete :destroy, id: @course_fee
    end

    assert_redirected_to course_fees_path
  end
end
