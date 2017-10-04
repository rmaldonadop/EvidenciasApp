class EvidenciaController < ApplicationController
  before_action :set_evidencium, only: [:show, :edit, :update, :destroy]
  #before_action :authenticate_usuario!, except: [:show, :index]

  # GET /evidencia
  # GET /evidencia.json
  def index
    @evidencia = Evidencium.all
  end

  # GET /evidencia/1
  # GET /evidencia/1.json
  def show
  end

  # GET /evidencia/new
  def new
    @evidencium = Evidencium.new
  end

  # GET /evidencia/1/edit
  def edit
  end

  # POST /evidencia
  # POST /evidencia.json
  def create
    @evidencium = Evidencium.new(evidencium_params)

    respond_to do |format|
      if @evidencium.save
        format.html { redirect_to @evidencium, notice: 'Evidencium was successfully created.' }
        format.json { render :show, status: :created, location: @evidencium }
      else
        format.html { render :new }
        format.json { render json: @evidencium.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /evidencia/1
  # PATCH/PUT /evidencia/1.json
  def update
    respond_to do |format|
      if @evidencium.update(evidencium_params)
        format.html { redirect_to @evidencium, notice: 'Evidencium was successfully updated.' }
        format.json { render :show, status: :ok, location: @evidencium }
      else
        format.html { render :edit }
        format.json { render json: @evidencium.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /evidencia/1
  # DELETE /evidencia/1.json
  def destroy
    @evidencium.destroy
    respond_to do |format|
      format.html { redirect_to evidencia_url, notice: 'Evidencium was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_evidencium
      @evidencium = Evidencium.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def evidencium_params
      params.require(:evidencium).permit(:codigo, :nombre, :descripcion, :universidad_id, :usuario_id, :tipo_evidencia_id, :archivo)
    end
end
