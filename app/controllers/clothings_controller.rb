class ClothingsController < ApplicationController
  before_action :set_clothing, only: [:show, :edit, :update, :destroy]
  # protect_from_forgery with: :null_session
  # skip_before_action :verify_authenticity_token, only: [:create]
  skip_before_action :verify_authenticity_token, if: :json_request?
  


  # GET /clothings
  # GET /clothings.json
  def index
    @clothings = Clothing.all
  end

  # GET /clothings/1
  # GET /clothings/1.json
  def show
  end

  # GET /clothings/new
  def new
    @clothing = Clothing.new
  end

  # GET /clothings/1/edit
  def edit
  end

  # POST /clothings
  # POST /clothings.json
  def create
    logger.info request.env
    @clothing = Clothing.new(clothing_params)

    respond_to do |format|
      if @clothing.save
        format.html { redirect_to @clothing, notice: 'Clothing was successfully created.' }
        format.json { render :show, status: :created, location: @clothing }
      else
        format.html { render :new }
        format.json { render json: @clothing.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /clothings/1
  # PATCH/PUT /clothings/1.json
  def update
    respond_to do |format|
      if @clothing.update(clothing_params)
        format.html { redirect_to @clothing, notice: 'Clothing was successfully updated.' }
        format.json { render :show, status: :ok, location: @clothing }
      else
        format.html { render :edit }
        format.json { render json: @clothing.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /clothings/1
  # DELETE /clothings/1.json
  def destroy
    @clothing.destroy
    respond_to do |format|
      format.html { redirect_to clothings_url, notice: 'Clothing was successfully destroyed.' }
      format.json { head :no_content }
    end
  end
  

  protected

  def json_request? 
    request.format.json?
  end


  private
    # Use callbacks to share common setup or constraints between actions.
    def set_clothing
      @clothing = Clothing.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def clothing_params
      params.require(:clothing).permit(:category, :style, :brand, :color, :seasons, :work_approp)
    end

end
