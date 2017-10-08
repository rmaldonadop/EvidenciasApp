require 'test_helper'

class EvidencesControllerTest < ActionDispatch::IntegrationTest
  setup do
    @evidence = evidences(:one)
  end

  test "should get index" do
    get evidences_url
    assert_response :success
  end

  test "should get new" do
    get new_evidence_url
    assert_response :success
  end

  test "should create evidence" do
    assert_difference('Evidence.count') do
      post evidences_url, params: { evidence: { codigo: @evidence.codigo, descripcion: @evidence.descripcion, evidencetype_id: @evidence.evidencetype_id, nombre: @evidence.nombre, universidad_id: @evidence.universidad_id, usuario_id: @evidence.usuario_id } }
    end

    assert_redirected_to evidence_url(Evidence.last)
  end

  test "should show evidence" do
    get evidence_url(@evidence)
    assert_response :success
  end

  test "should get edit" do
    get edit_evidence_url(@evidence)
    assert_response :success
  end

  test "should update evidence" do
    patch evidence_url(@evidence), params: { evidence: { codigo: @evidence.codigo, descripcion: @evidence.descripcion, evidencetype_id: @evidence.evidencetype_id, nombre: @evidence.nombre, universidad_id: @evidence.universidad_id, usuario_id: @evidence.usuario_id } }
    assert_redirected_to evidence_url(@evidence)
  end

  test "should destroy evidence" do
    assert_difference('Evidence.count', -1) do
      delete evidence_url(@evidence)
    end

    assert_redirected_to evidences_url
  end
end
