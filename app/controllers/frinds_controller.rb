class FrindsController < ApplicationController
  before_action :set_frind, only: [:show, :edit, :update, :destroy]
  before_action :authenticate_user!,except: [:index, :show]
  before_action :correct_user, only: [:edit, :update, :destroy]
  # GET /frinds
  # GET /frinds.json
  def index
    @frinds = Frind.all
  end

  # GET /frinds/1
  # GET /frinds/1.json
  def show
  end

  # GET /frinds/new
  def new
    # @frind = Frind.new
    @frind = current_user.frinds.build
  end

  # GET /frinds/1/edit
  def edit
  end

  # POST /frinds
  # POST /frinds.json
  def create
    # @frind = Frind.new(frind_params)
    @frind = current_user.frinds.build(frind_params)
    respond_to do |format|
      if @frind.save
        format.html { redirect_to @frind, notice: 'Frind was successfully created.' }
        format.json { render :show, status: :created, location: @frind }
      else
        format.html { render :new }
        format.json { render json: @frind.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /frinds/1
  # PATCH/PUT /frinds/1.json
  def update
    respond_to do |format|
      if @frind.update(frind_params)
        format.html { redirect_to @frind, notice: 'Frind was successfully updated.' }
        format.json { render :show, status: :ok, location: @frind }
      else
        format.html { render :edit }
        format.json { render json: @frind.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /frinds/1
  # DELETE /frinds/1.json
  def destroy
    @frind.destroy
    respond_to do |format|
      format.html { redirect_to frinds_url, notice: 'Frind was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  def correct_user
    @frind = current_user.frinds.find_by(id: params[:id])
    redirect_to frinds_path , notice: 'Not autherized!' if @frind.nil?
  end
  private
    # Use callbacks to share common setup or constraints between actions.
    def set_frind
      @frind = Frind.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def frind_params
      params.require(:frind).permit(:first_name, :last_name, :email, :phone, :user_id)
    end
end
