require 'test_helper'

class TextzonesControllerTest < ActionDispatch::IntegrationTest
  setup do
    @textzone = textzones(:one)
  end

  test "should get index" do
    get textzones_url, as: :json
    assert_response :success
  end

  test "should create textzone" do
    assert_difference('Textzone.count') do
      post textzones_url, params: {textzone: {content: @textzone.content, id_page: @textzone.id_page, id_textzone: @textzone.id_textzone, lang: @textzone.lang}}, as: :json
    end

    assert_response 201
  end

  test "should show textzone" do
    get textzone_url(@textzone), as: :json
    assert_response :success
  end

  test "should update textzone" do
    patch textzone_url(@textzone), params: {textzone: {content: @textzone.content, id_page: @textzone.id_page, id_textzone: @textzone.id_textzone, lang: @textzone.lang}}, as: :json
    assert_response 200
  end

  test "should destroy textzone" do
    assert_difference('Textzone.count', -1) do
      delete textzone_url(@textzone), as: :json
    end

    assert_response 204
  end
end
