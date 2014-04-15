require 'test_helper'

class AdmissionsControllerTest < ActionController::TestCase
  setup do
    @admission = admissions(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:admissions)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create admission" do
    assert_difference('Admission.count') do
      post :create, admission: { address_line1: @admission.address_line1, address_line2: @admission.address_line2, admission_no: @admission.admission_no, birth_place: @admission.birth_place, blood_group: @admission.blood_group, city: @admission.city, education: @admission.education, email: @admission.email, first_name: @admission.first_name, gender: @admission.gender, guardian_email: @admission.guardian_email, guardian_name: @admission.guardian_name, income: @admission.income, language: @admission.language, last_name: @admission.last_name, middle_name: @admission.middle_name, occupation: @admission.occupation, phone1: @admission.phone1, phone2: @admission.phone2, photo_content_type: @admission.photo_content_type, photo_filename: @admission.photo_filename, pin_code: @admission.pin_code, relation: @admission.relation, religion: @admission.religion, state: @admission.state, status_description: @admission.status_description }
    end

    assert_redirected_to admission_path(assigns(:admission))
  end

  test "should show admission" do
    get :show, id: @admission
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @admission
    assert_response :success
  end

  test "should update admission" do
    put :update, id: @admission, admission: { address_line1: @admission.address_line1, address_line2: @admission.address_line2, admission_no: @admission.admission_no, birth_place: @admission.birth_place, blood_group: @admission.blood_group, city: @admission.city, education: @admission.education, email: @admission.email, first_name: @admission.first_name, gender: @admission.gender, guardian_email: @admission.guardian_email, guardian_name: @admission.guardian_name, income: @admission.income, language: @admission.language, last_name: @admission.last_name, middle_name: @admission.middle_name, occupation: @admission.occupation, phone1: @admission.phone1, phone2: @admission.phone2, photo_content_type: @admission.photo_content_type, photo_filename: @admission.photo_filename, pin_code: @admission.pin_code, relation: @admission.relation, religion: @admission.religion, state: @admission.state, status_description: @admission.status_description }
    assert_redirected_to admission_path(assigns(:admission))
  end

  test "should destroy admission" do
    assert_difference('Admission.count', -1) do
      delete :destroy, id: @admission
    end

    assert_redirected_to admissions_path
  end
end
