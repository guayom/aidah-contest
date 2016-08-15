class JuriesController < ApplicationController
  before_action :set_jury, only: [:show, :edit, :update, :destroy]

  # GET /juries
  def index
    @juries = Jury.all
  end

  # GET /juries/1
  def show
  end

  # GET /juries/new
  def new
    @jury = Jury.new
  end

  # GET /juries/1/edit
  def edit
  end

  # POST /juries
  def create
    @jury = Jury.new(jury_params)

    if @jury.save
      redirect_to @jury, notice: 'Jury was successfully created.'
    else
      render :new
    end
  end

  # PATCH/PUT /juries/1
  def update
    if @jury.update(jury_params)
      redirect_to @jury, notice: 'Jury was successfully updated.'
    else
      render :edit
    end
  end

  # DELETE /juries/1
  def destroy
    @jury.destroy
    redirect_to juries_url, notice: 'Jury was successfully destroyed.'
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_jury
      @jury = Jury.find(params[:id])
    end

    # Only allow a trusted parameter "white list" through.
    def jury_params
      params.require(:jury).permit(:name, :email, :bio)
    end
end
