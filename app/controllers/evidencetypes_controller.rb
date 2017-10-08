class EvidencetypesController < ApplicationController
  before_action :set_evidencetype, only: [:show, :edit, :update, :destroy]

  # GET /evidencetypes
  # GET /evidencetypes.json
  def index
    @evidencetypes = Evidencetype.all
  end

  # GET /evidencetypes/1
  # GET /evidencetypes/1.json
  def show
  end

  # GET /evidencetypes/new
  def new
    @evidencetype = Evidencetype.new
  end

  # GET /evidencetypes/1/edit
  def edit
  end

  # POST /evidencetypes
  # POST /evidencetypes.json
  def create
    @evidencetype = Evidencetype.new(evidencetype_params)

    respond_to do |format|
      if @evidencetype.save
        format.html { redirect_to @evidencetype, notice: 'Evidencetype was successfully created.' }
        format.json { render :show, status: :created, location: @evidencetype }
      else
        format.html { render :new }
        format.json { render json: @evidencetype.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /evidencetypes/1
  # PATCH/PUT /evidencetypes/1.json
  def update
    respond_to do |format|
      if @evidencetype.update(evidencetype_params)
        format.html { redirect_to @evidencetype, notice: 'Evidencetype was successfully updated.' }
        format.json { render :show, status: :ok, location: @evidencetype }
      else
        format.html { render :edit }
        format.json { render json: @evidencetype.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /evidencetypes/1
  # DELETE /evidencetypes/1.json
  def destroy
    @evidencetype.destroy
    respond_to do |format|
      format.html { redirect_to evidencetypes_url, notice: 'Evidencetype was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_evidencetype
      @evidencetype = Evidencetype.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def evidencetype_params
      params.require(:evidencetype).permit(:codigo, :tipo)
    end
end
