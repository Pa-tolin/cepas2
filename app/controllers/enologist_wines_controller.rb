class EnologistWinesController < ApplicationController
  before_action :set_enologist_wine, only: %i[ show edit update destroy ]

  # GET /enologist_wines or /enologist_wines.json
  def index
    @enologist_wines = EnologistWine.all
  end

  # GET /enologist_wines/1 or /enologist_wines/1.json
  def show
  end

  # GET /enologist_wines/new
  def new
    @enologist_wine = EnologistWine.new
    @wines = Wine.all.pluck(:name, :id)
    @enologists = Enologist.all.pluck(:name, :id)
  end

  # GET /enologist_wines/1/edit
  def edit
  end

  # POST /enologist_wines or /enologist_wines.json
  def create
    @enologist_wine = EnologistWine.new(enologist_wine_params)

    respond_to do |format|
      if @enologist_wine.save
        format.html { redirect_to @enologist_wine, notice: "Creado exitosamente." }
        format.json { render :show, status: :created, location: @enologist_wine }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @enologist_wine.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /enologist_wines/1 or /enologist_wines/1.json
  def update
    respond_to do |format|
      if @enologist_wine.update(enologist_wine_params)
        format.html { redirect_to @enologist_wine, notice: "Ingresado exitosamente." }
        format.json { render :show, status: :ok, location: @enologist_wine }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @enologist_wine.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /enologist_wines/1 or /enologist_wines/1.json
  def destroy
    @enologist_wine.destroy
    respond_to do |format|
      format.html { redirect_to enologist_wines_url, notice: "Eliminado exitosamente." }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_enologist_wine
      @enologist_wine = EnologistWine.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def enologist_wine_params
      params.require(:enologist_wine).permit(:score, :wine_id, :enologist_id )
    end
end
