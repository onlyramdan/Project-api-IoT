require "test_helper"

class AlatsControllerTest < ActionDispatch::IntegrationTest
  setup do
    @alat = alats(:one)
  end

  test "should get index" do
    get alats_url, as: :json
    assert_response :success
  end

  test "should create alat" do
    assert_difference("Alat.count") do
      post alats_url, params: { alat: { lokasi: @alat.lokasi, nama_alat: @alat.nama_alat, status: @alat.status } }, as: :json
    end

    assert_response :created
  end

  test "should show alat" do
    get alat_url(@alat), as: :json
    assert_response :success
  end

  test "should update alat" do
    patch alat_url(@alat), params: { alat: { lokasi: @alat.lokasi, nama_alat: @alat.nama_alat, status: @alat.status } }, as: :json
    assert_response :success
  end

  test "should destroy alat" do
    assert_difference("Alat.count", -1) do
      delete alat_url(@alat), as: :json
    end

    assert_response :no_content
  end
end
