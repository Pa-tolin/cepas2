class WinesController < ApplicationController
  before_action :set_wine, only: %i[ show edit update destroy ]
  before_action :authenticate_user!
  
  # GET /wines or /wines.json
  def index
    @wines = Wine.all
    
  end

  # GET /wines/1 or /wines/1.json
  def show
  end

  
  # GET /wines/new
  def new
    @wine = Wine.new
    @strains = Strain.available.pluck(:name, :id)  #repasar, los botones de build, es para dar mas de una seleccion
    3.times {@wine.wine_strains.build}
    # @wine.wine_strains.build
    # @wine.wine_strains.build
    # @wine.wine_strains.build

    @enologists = Enologist.order('age DESC').pluck(:name, :id)
    1.times {@wine.enologist_wines.build}
    
  end

  # GET /wines/1/edit
  def edit
    @strains = Strain.available.pluck(:name, :id)  #repasar, los botones de build, es para dar mas de una seleccion
    3.times { @wine.wine_strains.build }  
    @enologists = Enologist.order('age DESC').pluck(:name, :id)

    #para que aparesca el score en edit
    @wine.enologist_wines.build
  end

  # POST /wines or /wines.json
  def create
    @wine = Wine.new(wine_params)

    respond_to do |format|
      if @wine.save
        format.html { redirect_to @wine, notice: "Creado exitosamente." }
        format.json { render :show, status: :created, location: @wine }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @wine.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /wines/1 or /wines/1.json
  def update
    respond_to do |format|
      if @wine.update(wine_params)
        format.html { redirect_to @wine, notice: "Ingresado exitosamente." }
        format.json { render :show, status: :ok, location: @wine }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @wine.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /wines/1 or /wines/1.json
  def destroy
    @wine.destroy
    respond_to do |format|
      format.html { redirect_to wines_url, notice: "Eliminado exitosamente." }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_wine
      @wine = Wine.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def wine_params
      params.require(:wine).permit(:name, wine_strains_attributes: [:id, :strain_id, :percentage, :_destroy], enologist_wines_attributes: [:id, :enologist_id, :score, :_destroy], enologist: [:name, :age, :natioanlity])
    end
end
