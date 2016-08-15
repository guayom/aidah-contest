class ParametersController < ApplicationController
  before_action :set_parameter, only: [:show, :edit, :update, :destroy]

  # GET /parameters
  def index
    @parameters = Parameter.all
  end

  # GET /parameters/1
  def show
  end

  # GET /parameters/new
  def new
    @parameter = Parameter.new
  end

  # GET /parameters/1/edit
  def edit
  end

  # POST /parameters
  def create
    @parameter = Parameter.new(parameter_params)

    if @parameter.save
      redirect_to @parameter, notice: 'Parameter was successfully created.'
    else
      render :new
    end
  end

  # PATCH/PUT /parameters/1
  def update
    if @parameter.update(parameter_params)
      redirect_to @parameter, notice: 'Parameter was successfully updated.'
    else
      render :edit
    end
  end

  # DELETE /parameters/1
  def destroy
    @parameter.destroy
    redirect_to parameters_url, notice: 'Parameter was successfully destroyed.'
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_parameter
      @parameter = Parameter.find(params[:id])
    end

    # Only allow a trusted parameter "white list" through.
    def parameter_params
      params.require(:parameter).permit(:title)
    end
end
