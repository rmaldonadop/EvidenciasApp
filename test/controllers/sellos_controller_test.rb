require 'test_helper'

class SellosControllerTest < ActionDispatch::IntegrationTest
  setup do
    @sello = sellos(:one)
  end

  test "should get index" do
    get sellos_url
    assert_response :success
  end

  test "should get new" do
    get new_sello_url
    assert_response :success
  end

  test "should create sello" do
    assert_difference('Sello.count') do
      post sellos_url, params: { sello: { codigo: @sello.codigo, tipo: @sello.tipo } }
    end

    assert_redirected_to sello_url(Sello.last)
  end

  test "should show sello" do
    get sello_url(@sello)
    assert_response :success
  end

  test "should get edit" do
    get edit_sello_url(@sello)
    assert_response :success
  end

  test "should update sello" do
    patch sello_url(@sello), params: { sello: { codigo: @sello.codigo, tipo: @sello.tipo } }
    assert_redirected_to sello_url(@sello)
  end

  test "should destroy sello" do
    assert_difference('Sello.count', -1) do
      delete sello_url(@sello)
    end

    assert_redirected_to sellos_url
  end
end
