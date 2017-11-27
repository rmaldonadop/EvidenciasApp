class SellosController < ApplicationController
  before_action :set_sello, only: [:show, :edit, :update, :destroy]

  # GET /sellos
  # GET /sellos.json
  def index
    @sellos = Sello.all
  end

  # GET /sellos/1
  # GET /sellos/1.json
  def show
  end

  # GET /sellos/new
  def new
    @sello = Sello.new
  end

  # GET /sellos/1/edit
  def edit
  end

  # POST /sellos
  # POST /sellos.json
  def create
    @sello = Sello.new(sello_params)

    respond_to do |format|
      if @sello.save
        format.html { redirect_to @sello, notice: 'Sello was successfully created.' }
        format.json { render :show, status: :created, location: @sello }
      else
        format.html { render :new }
        format.json { render json: @sello.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /sellos/1
  # PATCH/PUT /sellos/1.json
  def update
    respond_to do |format|
      if @sello.update(sello_params)
        format.html { redirect_to @sello, notice: 'Sello was successfully updated.' }
        format.json { render :show, status: :ok, location: @sello }
      else
        format.html { render :edit }
        format.json { render json: @sello.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /sellos/1
  # DELETE /sellos/1.json
  def destroy
    @sello.destroy
    respond_to do |format|
      format.html { redirect_to sellos_url, notice: 'Sello was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_sello
      @sello = Sello.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def sello_params
      params.require(:sello).permit(:codigo, :tipo)
    end
end
