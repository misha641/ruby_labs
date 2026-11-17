
require "test_helper"

class MedicinesControllerTest < ActionDispatch::IntegrationTest
  include Devise::Test::IntegrationHelpers

  setup do
    @owner = users(:one)
    @other_user = users(:two)

    @owner.update!(
      name: "Іван",
      password: "password123",
      password_confirmation: "password123"
    )

    @other_user.update!(
      name: "Петро",
      password: "password123",
      password_confirmation: "password123"
    )

    @medicine = medicines(:one)
    @medicine.update!(user: @owner)
  end

  test "anyone can view medicines" do
    get medicines_url
    assert_response :success
  end

  test "anyone can view a medicine" do
    get medicine_url(@medicine)
    assert_response :success
  end

  test "guest cannot create medicine" do
    get new_medicine_url
    assert_redirected_to new_user_session_path
  end

  test "signed in user can open new medicine form" do
    sign_in @owner

    get new_medicine_url
    assert_response :success
  end

  test "user can create own medicine" do
    sign_in @owner

    assert_difference("Medicine.count", 1) do
      post medicines_url, params: {
        medicine: {
          name: "Нурофен",
          category: "Безрецептурні",
          price: 145,
          description: "Знеболювальний препарат"
        }
      }
    end

    medicine = Medicine.order(:id).last
    assert_equal @owner.id, medicine.user_id
  end

  test "owner can edit own medicine" do
    sign_in @owner

    get edit_medicine_url(@medicine)
    assert_response :success
  end

  test "other user cannot edit medicine" do
    sign_in @other_user

    get edit_medicine_url(@medicine)
    assert_redirected_to medicines_path
  end

  test "other user cannot update medicine" do
    sign_in @other_user

    patch medicine_url(@medicine), params: {
      medicine: { name: "Чужа назва" }
    }

    assert_redirected_to medicines_path
    assert_not_equal "Чужа назва", @medicine.reload.name
  end

  test "other user cannot delete medicine" do
    sign_in @other_user

    assert_no_difference("Medicine.count") do
      delete medicine_url(@medicine)
    end
  end

  test "owner can delete own medicine" do
    sign_in @owner

    assert_difference("Medicine.count", -1) do
      delete medicine_url(@medicine)
    end
  end

  test "admin can edit another user's medicine" do
    @other_user.admin!
    sign_in @other_user

    get edit_medicine_url(@medicine)
    assert_response :success
  end

  test "ordinary user cannot delete all medicines" do
    sign_in @owner

    assert_no_difference("Medicine.count") do
      delete delete_all_medicines_path
    end

    assert_redirected_to medicines_path
  end
end
