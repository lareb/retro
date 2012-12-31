require 'test_helper'

class StudentsControllerTest < ActionController::TestCase
  setup do
    @student = students(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:students)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create student" do
    assert_difference('Student.count') do
      post :create, student: { address_1: @student.address_1, address_2: @student.address_2, blood_group: @student.blood_group, contact_no_1: @student.contact_no_1, contact_no_2: @student.contact_no_2, dob: @student.dob, enrollment_no: @student.enrollment_no, father_name: @student.father_name, first_name: @student.first_name, klass_id: @student.klass_id, last_name: @student.last_name, local_guardian_name: @student.local_guardian_name, mother_name: @student.mother_name, roll_no: @student.roll_no }
    end

    assert_redirected_to student_path(assigns(:student))
  end

  test "should show student" do
    get :show, id: @student
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @student
    assert_response :success
  end

  test "should update student" do
    put :update, id: @student, student: { address_1: @student.address_1, address_2: @student.address_2, blood_group: @student.blood_group, contact_no_1: @student.contact_no_1, contact_no_2: @student.contact_no_2, dob: @student.dob, enrollment_no: @student.enrollment_no, father_name: @student.father_name, first_name: @student.first_name, klass_id: @student.klass_id, last_name: @student.last_name, local_guardian_name: @student.local_guardian_name, mother_name: @student.mother_name, roll_no: @student.roll_no }
    assert_redirected_to student_path(assigns(:student))
  end

  test "should destroy student" do
    assert_difference('Student.count', -1) do
      delete :destroy, id: @student
    end

    assert_redirected_to students_path
  end
end
