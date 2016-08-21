class ParticipantRatingsController < ApplicationController
  before_action :set_participant_rating, only: [:show, :edit, :update, :destroy]

  # GET /participant_ratings
  def index
    @participant_ratings = ParticipantRating.all
  end

  # GET /participant_ratings/1
  def show
  end

  # GET /participant_ratings/new
  def new
    @parameters = Parameter.all
    @participant = Participant.find(params[:participant_id])

    @kennel = []
    @parameters.each do |parameter|
      @participant_rating = ParticipantRating.new
      @participant_rating.participant_id = Participant.find(params[:participant_id]).id
      @participant_rating.category_id = Category.find(params[:category_id]).id
      @participant_rating.parameter = parameter
      @kennel << @participant_rating
    end
  end

  # GET /participant_ratings/1/edit
  def edit
  end

  # POST /participant_ratings

  def create
    @results = []
    @allParams = params["participant_ratings"]
    @category_id = params["participant_ratings"][:category_id]
    @allParams.each do |parameter|
      parameter = parameter.to_i
      if ParticipantRating.create(participant_rating_params)
        @results << 'exito'
      else
        @results << error
      end
    end
    #necesito validar esto
    unless @results.include? "error"
      redirect_to category_path(@category_id ), notice: "Has calficado a esta participante exitosamente"
    end
  end

  # PATCH/PUT /participant_ratings/1
  def update
    if @participant_rating.update(participant_rating_params)
      redirect_to @participant_rating, notice: 'Participant rating was successfully updated.'
    else
      render :edit
    end
  end

  # DELETE /participant_ratings/1
  def destroy
    @participant_rating.destroy
    redirect_to participant_ratings_url, notice: 'Participant rating was successfully destroyed.'
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_participant_rating
      @participant_rating = ParticipantRating.find(params[:id])
    end

    # Only allow a trusted parameter "white list" through.
    def participant_rating_params
      params.require(:participant_ratings).permit(:participant_id, :category_id, :parameter_id, :score, :participant_ratings => [:participant_id, :category_id, :parameter_id, :score])
      #my_params.params.permit(:participant_id, :category_id, :parameter_id, :score)
    end
end
