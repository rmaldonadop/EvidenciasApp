require 'test_helper'

class EvidencetypesControllerTest < ActionDispatch::IntegrationTest
  setup do
    @evidencetype = evidencetypes(:one)
  end

  test "should get index" do
    get evidencetypes_url
    assert_response :success
  end

  test "should get new" do
    get new_evidencetype_url
    assert_response :success
  end

  test "should create evidencetype" do
    assert_difference('Evidencetype.count') do
      post evidencetypes_url, params: { evidencetype: { codigo: @evidencetype.codigo, tipo: @evidencetype.tipo } }
    end

    assert_redirected_to evidencetype_url(Evidencetype.last)
  end

  test "should show evidencetype" do
    get evidencetype_url(@evidencetype)
    assert_response :success
  end

  test "should get edit" do
    get edit_evidencetype_url(@evidencetype)
    assert_response :success
  end

  test "should update evidencetype" do
    patch evidencetype_url(@evidencetype), params: { evidencetype: { codigo: @evidencetype.codigo, tipo: @evidencetype.tipo } }
    assert_redirected_to evidencetype_url(@evidencetype)
  end

  test "should destroy evidencetype" do
    assert_difference('Evidencetype.count', -1) do
      delete evidencetype_url(@evidencetype)
    end

    assert_redirected_to evidencetypes_url
  end
end
