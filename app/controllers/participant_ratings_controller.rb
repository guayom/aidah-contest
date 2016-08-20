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
    @participant_rating = ParticipantRating.new
  end

  # GET /participant_ratings/1/edit
  def edit
  end

  # POST /participant_ratings
  def create
    @participant_rating = ParticipantRating.new(participant_rating_params)

    if @participant_rating.save
      redirect_to @participant_rating, notice: 'Participant rating was successfully created.'
    else
      render :new
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
      params.require(:participant_rating).permit(:participant_id, :category_id, :parameter_id, :score)
    end
end
