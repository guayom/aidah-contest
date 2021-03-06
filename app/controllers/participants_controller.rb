class ParticipantsController < ApplicationController
  before_action :set_participant, only: [:show, :edit, :update, :destroy]

  def user
    @user
  end

  def user_attributes=(attributes)
    #process
  end


  # GET /participants
  def index
    @category = Category.friendly.find(params[:category_id])
    @participants = @category.participants
  end

  # GET /participants/1
  def show
    @participant_ratings = ParticipantRating.where(:participant_id => @participant.id)
    @parameters = Parameter.all
  end

  # GET /participants/new
  def new
    @participant = Participant.new
    @participant.build_user
    @categories = Category.all
  end

  # GET /participants/1/edit
  def edit
  end

  # POST /participants
  def create
    @participant = Participant.new(participant_params)

    if @participant.save
      redirect_to @participant, notice: 'Te has registrado como participante exitosamente'
    else
      render :new
    end
  end

  # PATCH/PUT /participants/1
  def update
    if @participant.update(participant_params)
      redirect_to @participant, notice: 'Has editado tu perfil correctamente'
    else
      render :edit
    end
  end

  # DELETE /participants/1
  def destroy
    @participant.destroy
    redirect_to participants_url, notice: 'Participant was successfully destroyed.'
  end

  def upvote
    @participant = Participant.find(params[:id])
    @category = Category.friendly.find(params[:category_id])
    @participant.votes.create(:user_id => current_user.id, :category_id => @category.id)
    redirect_to(category_path(@category.slug))
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_participant
      @participant = Participant.find(params[:id])
    end

    def participant_params
      params.require(:participant).permit(:name, :email, :lastname, :lastname2, :tel, :bio, user_attributes: [ :email, :password, :password_confirmation ], category_ids:[])
    end
end
