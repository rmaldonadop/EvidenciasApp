class EvidencesController < ApplicationController
  load_and_authorize_resource

  before_action :set_evidence, only: [:show, :edit, :update, :destroy]
  before_action :authenticate_usuario!, except: [:show, :index]

  # GET /evidences
  # GET /evidences.json
  def index
    @evidences = if params[:term]
      Evidence.search(params[:term])
    else
      if params[:term2] == nil
        Evidence.search(params[:term])
      else
        @evidences = Evidence.all
        @evidences = @evidences.search_cod(params[:facultad][:codigo])
        @evidences = @evidences.search_cod(params[:escuela][:codigo])
        @evidences = @evidences.search_cod(params[:carrera][:codigo])
        @evidences = @evidences.search_cod(params[:sello][:codigo])
        @evidences = @evidences.search_cod(params[:evidencetype][:codigo])
      end
    end

    respond_to do |format|
      format.html
    end
  end

  # GET /evidences/1
  # GET /evidences/1.json
  def show
  end

  # GET /evidences/new
  def new
    @evidence = Evidence.new
  end

  # GET /evidences/1/edit
  def edit
  end

  # POST /evidences
  # POST /evidences.json
  def create
    
    tipo_ev = Evidencetype.find(evidence_params[:evidencetype_id]).codigo
    sello = Sello.find(evidence_params[:sello_id]).codigo 
    evidence_params[:codigo] = "#{auxiliar_params[:facultad]}_#{auxiliar_params[:escuela]}_#{auxiliar_params[:carrera]}_#{sello}_#{tipo_ev}"
    evidence_params[:nombre] = "#{evidence_params[:codigo]}_#{evidence_params[:nombre]}.#{evidence_params[:archivo].original_filename.split(".").last.downcase}"
    evidence_params[:universidad_id] = 1

    @evidence = current_usuario.evidences.new(evidence_params)

    respond_to do |format|
      if @evidence.save
        format.html { redirect_to @evidence, notice: 'Evidence was successfully created.' }
        format.json { render :show, status: :created, location: @evidence }
      else
        format.html { render :new }
        format.json { render json: @evidence.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /evidences/1
  # PATCH/PUT /evidences/1.json
  def update
    respond_to do |format|
      if @evidence.update(evidence_params)
        format.html { redirect_to @evidence, notice: 'Evidence was successfully updated.' }
        format.json { render :show, status: :ok, location: @evidence }
      else
        format.html { render :edit }
        format.json { render json: @evidence.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /evidences/1
  # DELETE /evidences/1.json
  def destroy
    @evidence.destroy
    respond_to do |format|
      format.html { redirect_to evidences_url, notice: 'Evidence was successfully destroyed.' }
      format.json { head :no_content }
    end
  end


  private
    # Use callbacks to share common setup or constraints between actions.
    def set_evidence
      @evidence = Evidence.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def evidence_params
      #params.require(:evidence).permit(:codigo, :nombre, :descripcion, :universidad_id, :usuario_id, :evidencetype_id, :archivo)
      @evidence_params ||= params.require(:evidence).permit(:codigo, :nombre, :descripcion, :universidad_id, :usuario_id, :evidencetype_id, :sello_id, :archivo, :term)
    end

    def auxiliar_params
      @auxiliar_params ||= params.require(:evidence).permit(:facultad, :escuela, :carrera)
    end
end
