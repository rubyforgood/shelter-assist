class FostersController < ApplicationController
  before_action :set_foster, only: %i[ show edit update destroy ]

  # GET /fosters or /fosters.json
  def index
    @fosters = Foster.all
  end

  # GET /fosters/1 or /fosters/1.json
  def show
  end

  # GET /fosters/new
  def new
    @foster = Foster.new
  end

  # GET /fosters/1/edit
  def edit
  end

  # POST /fosters or /fosters.json
  def create
    @foster = Foster.new(foster_params)

    respond_to do |format|
      if @foster.save
        format.html { redirect_to @foster, notice: "Foster was successfully created." }
        format.json { render :show, status: :created, location: @foster }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @foster.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /fosters/1 or /fosters/1.json
  def update
    respond_to do |format|
      if @foster.update(foster_params)
        format.html { redirect_to @foster, notice: "Foster was successfully updated." }
        format.json { render :show, status: :ok, location: @foster }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @foster.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /fosters/1 or /fosters/1.json
  def destroy
    @foster.destroy
    respond_to do |format|
      format.html { redirect_to fosters_url, notice: "Foster was successfully destroyed." }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_foster
      @foster = Foster.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def foster_params
      params.fetch(:foster, {}).permit(:full_name, :email, :street, :apt, :phone, :is_home_during_day, :transportation)
    end
end
