require 'test_helper'

class PermisosControllerTest < ActionDispatch::IntegrationTest
  setup do
    @permiso = permisos(:one)
  end

  test "should get index" do
    get permisos_url
    assert_response :success
  end

  test "should get new" do
    get new_permiso_url
    assert_response :success
  end

  test "should create permiso" do
    assert_difference('Permiso.count') do
      post permisos_url, params: { permiso: { codigo: @permiso.codigo, descripcion: @permiso.descripcion, tipo: @permiso.tipo } }
    end

    assert_redirected_to permiso_url(Permiso.last)
  end

  test "should show permiso" do
    get permiso_url(@permiso)
    assert_response :success
  end

  test "should get edit" do
    get edit_permiso_url(@permiso)
    assert_response :success
  end

  test "should update permiso" do
    patch permiso_url(@permiso), params: { permiso: { codigo: @permiso.codigo, descripcion: @permiso.descripcion, tipo: @permiso.tipo } }
    assert_redirected_to permiso_url(@permiso)
  end

  test "should destroy permiso" do
    assert_difference('Permiso.count', -1) do
      delete permiso_url(@permiso)
    end

    assert_redirected_to permisos_url
  end
end
