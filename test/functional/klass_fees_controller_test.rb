require 'test_helper'

class KlassFeesControllerTest < ActionController::TestCase
  setup do
    @klass_fee = klass_fees(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:klass_fees)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create klass_fee" do
    assert_difference('KlassFee.count') do
      post :create, klass_fee: { amount: @klass_fee.amount, cycle: @klass_fee.cycle, description: @klass_fee.description, fee_id: @klass_fee.fee_id, klass_id: @klass_fee.klass_id }
    end

    assert_redirected_to klass_fee_path(assigns(:klass_fee))
  end

  test "should show klass_fee" do
    get :show, id: @klass_fee
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @klass_fee
    assert_response :success
  end

  test "should update klass_fee" do
    put :update, id: @klass_fee, klass_fee: { amount: @klass_fee.amount, cycle: @klass_fee.cycle, description: @klass_fee.description, fee_id: @klass_fee.fee_id, klass_id: @klass_fee.klass_id }
    assert_redirected_to klass_fee_path(assigns(:klass_fee))
  end

  test "should destroy klass_fee" do
    assert_difference('KlassFee.count', -1) do
      delete :destroy, id: @klass_fee
    end

    assert_redirected_to klass_fees_path
  end
end
