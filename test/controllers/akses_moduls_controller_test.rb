require "test_helper"

class AksesModulsControllerTest < ActionDispatch::IntegrationTest
  setup do
    @akses_modul = akses_moduls(:one)
  end

  test "should get index" do
    get akses_moduls_url, as: :json
    assert_response :success
  end

  test "should create akses_modul" do
    assert_difference("AksesModul.count") do
      post akses_moduls_url, params: { akses_modul: { modul_id: @akses_modul.modul_id, user_role_id: @akses_modul.user_role_id } }, as: :json
    end

    assert_response :created
  end

  test "should show akses_modul" do
    get akses_modul_url(@akses_modul), as: :json
    assert_response :success
  end

  test "should update akses_modul" do
    patch akses_modul_url(@akses_modul), params: { akses_modul: { modul_id: @akses_modul.modul_id, user_role_id: @akses_modul.user_role_id } }, as: :json
    assert_response :success
  end

  test "should destroy akses_modul" do
    assert_difference("AksesModul.count", -1) do
      delete akses_modul_url(@akses_modul), as: :json
    end

    assert_response :no_content
  end
end
