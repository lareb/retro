require 'test_helper'

class TeacherSubjectsControllerTest < ActionController::TestCase
  setup do
    @teacher_subject = teacher_subjects(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:teacher_subjects)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create teacher_subject" do
    assert_difference('TeacherSubject.count') do
      post :create, teacher_subject: {  }
    end

    assert_redirected_to teacher_subject_path(assigns(:teacher_subject))
  end

  test "should show teacher_subject" do
    get :show, id: @teacher_subject
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @teacher_subject
    assert_response :success
  end

  test "should update teacher_subject" do
    put :update, id: @teacher_subject, teacher_subject: {  }
    assert_redirected_to teacher_subject_path(assigns(:teacher_subject))
  end

  test "should destroy teacher_subject" do
    assert_difference('TeacherSubject.count', -1) do
      delete :destroy, id: @teacher_subject
    end

    assert_redirected_to teacher_subjects_path
  end
end
