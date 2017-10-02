require 'test_helper'

class EscuelasControllerTest < ActionDispatch::IntegrationTest
  setup do
    @escuela = escuelas(:one)
  end

  test "should get index" do
    get escuelas_url
    assert_response :success
  end

  test "should get new" do
    get new_escuela_url
    assert_response :success
  end

  test "should create escuela" do
    assert_difference('Escuela.count') do
      post escuelas_url, params: { escuela: { codigo: @escuela.codigo, director: @escuela.director, facultad_id: @escuela.facultad_id, nombre: @escuela.nombre } }
    end

    assert_redirected_to escuela_url(Escuela.last)
  end

  test "should show escuela" do
    get escuela_url(@escuela)
    assert_response :success
  end

  test "should get edit" do
    get edit_escuela_url(@escuela)
    assert_response :success
  end

  test "should update escuela" do
    patch escuela_url(@escuela), params: { escuela: { codigo: @escuela.codigo, director: @escuela.director, facultad_id: @escuela.facultad_id, nombre: @escuela.nombre } }
    assert_redirected_to escuela_url(@escuela)
  end

  test "should destroy escuela" do
    assert_difference('Escuela.count', -1) do
      delete escuela_url(@escuela)
    end

    assert_redirected_to escuelas_url
  end
end
