require "test_helper"

class MonitoringsControllerTest < ActionDispatch::IntegrationTest
  setup do
    @monitoring = monitorings(:one)
  end

  test "should get index" do
    get monitorings_url, as: :json
    assert_response :success
  end

  test "should create monitoring" do
    assert_difference("Monitoring.count") do
      post monitorings_url, params: { monitoring: { amonia: @monitoring.amonia, debu: @monitoring.debu, kebisingan: @monitoring.kebisingan, kelembaban: @monitoring.kelembaban, lux: @monitoring.lux, suhu: @monitoring.suhu } }, as: :json
    end

    assert_response :created
  end

  test "should show monitoring" do
    get monitoring_url(@monitoring), as: :json
    assert_response :success
  end

  test "should update monitoring" do
    patch monitoring_url(@monitoring), params: { monitoring: { amonia: @monitoring.amonia, debu: @monitoring.debu, kebisingan: @monitoring.kebisingan, kelembaban: @monitoring.kelembaban, lux: @monitoring.lux, suhu: @monitoring.suhu } }, as: :json
    assert_response :success
  end

  test "should destroy monitoring" do
    assert_difference("Monitoring.count", -1) do
      delete monitoring_url(@monitoring), as: :json
    end

    assert_response :no_content
  end
end
