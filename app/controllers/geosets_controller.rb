class GeosetsController < ApplicationController
  before_action :set_geoset, only: %i[show edit update destroy]
  after_action :err_message, only: %i[create update]

  # GET /geosets or /geosets.json
  def index
    @geosets = Geoset.all
  end

  # GET /geosets/1 or /geosets/1.json
  def show
  end

  # GET /geosets/new
  def new
    @geoset = Geoset.new
  end

  # GET /geosets/1/edit
  def edit
    # Setting hash object to string for form
    @geoset.geojson = @geoset.raw_geojson
  end

  # POST /geosets or /geosets.json
  def create
    @geoset = Geoset.new(geoset_params)

    respond_to do |format|
      if @geoset.save
        format.html { redirect_to @geoset, notice: "Geoset was successfully created." }
        format.json { render :show, status: :created, location: @geoset }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @geoset.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /geosets/1 or /geosets/1.json
  def update
    respond_to do |format|
      if @geoset.update(geoset_params)
        format.html { redirect_to @geoset, notice: "Geoset was successfully updated." }
        format.json { render :show, status: :ok, location: @geoset }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @geoset.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /geosets/1 or /geosets/1.json
  def destroy
    @geoset.destroy
    respond_to do |format|
      format.html { redirect_to geosets_url, notice: "Geoset was successfully destroyed." }
      format.json { head :no_content }
    end
  end

  private

  # Use callbacks to share common setup or constraints between actions.
  def set_geoset
    @geoset = Geoset.find(params[:id])
  end

  # Only allow a list of trusted parameters through.
  def geoset_params
    params.require(:geoset).permit(:name, :geojson, :geojson_file)
  end

  # Changing the notice message if any errors occured while parsing file
  def err_message
    return unless @geoset.err_message.present?

    flash[:notice] = nil
    flash[:alert] = @geoset.err_message
  end
end
