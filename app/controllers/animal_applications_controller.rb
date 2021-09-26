class AnimalApplicationsController < ApplicationController
  before_action :set_animal_application, only: %i[ show edit update destroy ]

  # GET /animal_applications or /animal_applications.json
  def index
    @animal_applications = AnimalApplication.all
  end

  # GET /animal_applications/1 or /animal_applications/1.json
  def show
  end

  # GET /animal_applications/new
  def new
    @animal_application = AnimalApplication.new
  end

  # GET /animal_applications/1/edit
  def edit
  end

  # POST /animal_applications or /animal_applications.json
  def create
    @animal_application = AnimalApplication.new(animal_application_params)

    respond_to do |format|
      if @animal_application.save
        format.html { redirect_to @animal_application, notice: "Animal application was successfully created." }
        format.json { render :show, status: :created, location: @animal_application }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @animal_application.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /animal_applications/1 or /animal_applications/1.json
  def update
    respond_to do |format|
      if @animal_application.update(animal_application_params)
        format.html { redirect_to @animal_application, notice: "Animal application was successfully updated." }
        format.json { render :show, status: :ok, location: @animal_application }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @animal_application.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /animal_applications/1 or /animal_applications/1.json
  def destroy
    @animal_application.destroy
    respond_to do |format|
      format.html { redirect_to animal_applications_url, notice: "Animal application was successfully destroyed." }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_animal_application
      @animal_application = AnimalApplication.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def animal_application_params
      params.fetch(:animal_application, {}).permit(:inspiration, :start_date)
    end
end
