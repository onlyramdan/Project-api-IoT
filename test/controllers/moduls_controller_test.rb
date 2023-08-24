require "test_helper"

class ModulsControllerTest < ActionDispatch::IntegrationTest
  setup do
    @modul = moduls(:one)
  end

  test "should get index" do
    get moduls_url, as: :json
    assert_response :success
  end

  test "should create modul" do
    assert_difference("Modul.count") do
      post moduls_url, params: { modul: { nama: @modul.nama, status: @modul.status, url: @modul.url } }, as: :json
    end

    assert_response :created
  end

  test "should show modul" do
    get modul_url(@modul), as: :json
    assert_response :success
  end

  test "should update modul" do
    patch modul_url(@modul), params: { modul: { nama: @modul.nama, status: @modul.status, url: @modul.url } }, as: :json
    assert_response :success
  end

  test "should destroy modul" do
    assert_difference("Modul.count", -1) do
      delete modul_url(@modul), as: :json
    end

    assert_response :no_content
  end
end
