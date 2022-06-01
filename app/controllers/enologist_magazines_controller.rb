class EnologistMagazinesController < ApplicationController
  before_action :set_enologist_magazine, only: %i[ show edit update destroy ]

  # GET /enologist_magazines or /enologist_magazines.json
  def index
    @enologist_magazines = EnologistMagazine.all
  end

  # GET /enologist_magazines/1 or /enologist_magazines/1.json
  def show
  end

  # GET /enologist_magazines/new
  def new
    @enologist_magazine = EnologistMagazine.new
  end

  # GET /enologist_magazines/1/edit
  def edit
  end

  # POST /enologist_magazines or /enologist_magazines.json
  def create
    @enologist_magazine = EnologistMagazine.new(enologist_magazine_params)

    respond_to do |format|
      if @enologist_magazine.save
        format.html { redirect_to @enologist_magazine, notice: "Creado exitosamente." }
        format.json { render :show, status: :created, location: @enologist_magazine }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @enologist_magazine.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /enologist_magazines/1 or /enologist_magazines/1.json
  def update
    respond_to do |format|
      if @enologist_magazine.update(enologist_magazine_params)
        format.html { redirect_to @enologist_magazine, notice: "Ingresado exitosamente." }
        format.json { render :show, status: :ok, location: @enologist_magazine }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @enologist_magazine.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /enologist_magazines/1 or /enologist_magazines/1.json
  def destroy
    @enologist_magazine.destroy
    respond_to do |format|
      format.html { redirect_to enologist_magazines_url, notice: "Eliminado exitosamente." }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_enologist_magazine
      @enologist_magazine = EnologistMagazine.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def enologist_magazine_params
      params.require(:enologist_magazine).permit(:editor, :writer, :reviewer, :enologist_id, :magazine_id)
    end
end
