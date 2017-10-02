class TipoEvidenciaController < ApplicationController
  before_action :set_tipo_evidencium, only: [:show, :edit, :update, :destroy]

  # GET /tipo_evidencia
  # GET /tipo_evidencia.json
  def index
    @tipo_evidencia = TipoEvidencium.all
  end

  # GET /tipo_evidencia/1
  # GET /tipo_evidencia/1.json
  def show
  end

  # GET /tipo_evidencia/new
  def new
    @tipo_evidencium = TipoEvidencium.new
  end

  # GET /tipo_evidencia/1/edit
  def edit
  end

  # POST /tipo_evidencia
  # POST /tipo_evidencia.json
  def create
    @tipo_evidencium = TipoEvidencium.new(tipo_evidencium_params)

    respond_to do |format|
      if @tipo_evidencium.save
        format.html { redirect_to @tipo_evidencium, notice: 'Tipo evidencium was successfully created.' }
        format.json { render :show, status: :created, location: @tipo_evidencium }
      else
        format.html { render :new }
        format.json { render json: @tipo_evidencium.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /tipo_evidencia/1
  # PATCH/PUT /tipo_evidencia/1.json
  def update
    respond_to do |format|
      if @tipo_evidencium.update(tipo_evidencium_params)
        format.html { redirect_to @tipo_evidencium, notice: 'Tipo evidencium was successfully updated.' }
        format.json { render :show, status: :ok, location: @tipo_evidencium }
      else
        format.html { render :edit }
        format.json { render json: @tipo_evidencium.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /tipo_evidencia/1
  # DELETE /tipo_evidencia/1.json
  def destroy
    @tipo_evidencium.destroy
    respond_to do |format|
      format.html { redirect_to tipo_evidencia_url, notice: 'Tipo evidencium was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_tipo_evidencium
      @tipo_evidencium = TipoEvidencium.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def tipo_evidencium_params
      params.require(:tipo_evidencium).permit(:codigo, :tipo)
    end
end
