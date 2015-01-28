class ClazzsController < ApplicationController
  before_action :set_clazz, only: [:show, :edit, :update, :destroy]

  # GET /clazzs
  # GET /clazzs.json
  def index
    @clazzs = Clazz.all
  end

  # GET /clazzs/1
  # GET /clazzs/1.json
  def show
  end

  # GET /clazzs/new
  def new
    @clazz = Clazz.new
  end

  # GET /clazzs/1/edit
  def edit
  end

  # POST /clazzs
  # POST /clazzs.json
  def create
    @clazz = Clazz.new(clazz_params)

    respond_to do |format|
      if @clazz.save
        format.html { redirect_to @clazz, notice: 'Clazz was successfully created.' }
        format.json { render action: 'show', status: :created, location: @clazz }
      else
        format.html { render action: 'new' }
        format.json { render json: @clazz.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /clazzs/1
  # PATCH/PUT /clazzs/1.json
  def update
    respond_to do |format|
      if @clazz.update(clazz_params)
        format.html { redirect_to @clazz, notice: 'Clazz was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: 'edit' }
        format.json { render json: @clazz.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /clazzs/1
  # DELETE /clazzs/1.json
  def destroy
    @clazz.destroy
    respond_to do |format|
      format.html { redirect_to clazzs_url }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_clazz
      @clazz = Clazz.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def clazz_params
      params.require(:clazz).permit(:name, :description, :start_time, :end_time, :group_id)
    end
end
