require 'test_helper'

class EvidenciaControllerTest < ActionDispatch::IntegrationTest
  setup do
    @evidencium = evidencia(:one)
  end

  test "should get index" do
    get evidencia_url
    assert_response :success
  end

  test "should get new" do
    get new_evidencium_url
    assert_response :success
  end

  test "should create evidencium" do
    assert_difference('Evidencium.count') do
      post evidencia_url, params: { evidencium: { codigo: @evidencium.codigo, descripcion: @evidencium.descripcion, nombre: @evidencium.nombre, tipo_evidencia_id: @evidencium.tipo_evidencia_id, universidad_id: @evidencium.universidad_id, usuario_id: @evidencium.usuario_id } }
    end

    assert_redirected_to evidencium_url(Evidencium.last)
  end

  test "should show evidencium" do
    get evidencium_url(@evidencium)
    assert_response :success
  end

  test "should get edit" do
    get edit_evidencium_url(@evidencium)
    assert_response :success
  end

  test "should update evidencium" do
    patch evidencium_url(@evidencium), params: { evidencium: { codigo: @evidencium.codigo, descripcion: @evidencium.descripcion, nombre: @evidencium.nombre, tipo_evidencia_id: @evidencium.tipo_evidencia_id, universidad_id: @evidencium.universidad_id, usuario_id: @evidencium.usuario_id } }
    assert_redirected_to evidencium_url(@evidencium)
  end

  test "should destroy evidencium" do
    assert_difference('Evidencium.count', -1) do
      delete evidencium_url(@evidencium)
    end

    assert_redirected_to evidencia_url
  end
end
