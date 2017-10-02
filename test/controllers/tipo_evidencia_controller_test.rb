require 'test_helper'

class TipoEvidenciaControllerTest < ActionDispatch::IntegrationTest
  setup do
    @tipo_evidencium = tipo_evidencia(:one)
  end

  test "should get index" do
    get tipo_evidencia_url
    assert_response :success
  end

  test "should get new" do
    get new_tipo_evidencium_url
    assert_response :success
  end

  test "should create tipo_evidencium" do
    assert_difference('TipoEvidencium.count') do
      post tipo_evidencia_url, params: { tipo_evidencium: { codigo: @tipo_evidencium.codigo, tipo: @tipo_evidencium.tipo } }
    end

    assert_redirected_to tipo_evidencium_url(TipoEvidencium.last)
  end

  test "should show tipo_evidencium" do
    get tipo_evidencium_url(@tipo_evidencium)
    assert_response :success
  end

  test "should get edit" do
    get edit_tipo_evidencium_url(@tipo_evidencium)
    assert_response :success
  end

  test "should update tipo_evidencium" do
    patch tipo_evidencium_url(@tipo_evidencium), params: { tipo_evidencium: { codigo: @tipo_evidencium.codigo, tipo: @tipo_evidencium.tipo } }
    assert_redirected_to tipo_evidencium_url(@tipo_evidencium)
  end

  test "should destroy tipo_evidencium" do
    assert_difference('TipoEvidencium.count', -1) do
      delete tipo_evidencium_url(@tipo_evidencium)
    end

    assert_redirected_to tipo_evidencia_url
  end
end
