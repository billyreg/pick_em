class PicksController < ApplicationController
  before_action :current_user_must_be_pick_user, only: [:edit, :update, :destroy] 

  before_action :set_pick, only: [:show, :edit, :update, :destroy]

  # GET /picks
  def index
    @q = current_user.picks.ransack(params[:q])
    @picks = @q.result(:distinct => true).includes(:user, :game).page(params[:page]).per(10)
  end

  # GET /picks/1
  def show
  end

  # GET /picks/new
  def new
    @pick = Pick.new
  end

  # GET /picks/1/edit
  def edit
  end

  # POST /picks
  def create
    @pick = Pick.new(pick_params)

    if @pick.save
      message = 'Pick was successfully created.'
      if Rails.application.routes.recognize_path(request.referrer)[:controller] != Rails.application.routes.recognize_path(request.path)[:controller]
        redirect_back fallback_location: request.referrer, notice: message
      else
        redirect_to @pick, notice: message
      end
    else
      render :new
    end
  end

  # PATCH/PUT /picks/1
  def update
    if @pick.update(pick_params)
      redirect_to @pick, notice: 'Pick was successfully updated.'
    else
      render :edit
    end
  end

  # DELETE /picks/1
  def destroy
    @pick.destroy
    message = "Pick was successfully deleted."
    if Rails.application.routes.recognize_path(request.referrer)[:controller] != Rails.application.routes.recognize_path(request.path)[:controller]
      redirect_back fallback_location: request.referrer, notice: message
    else
      redirect_to picks_url, notice: message
    end
  end


  private

  def current_user_must_be_pick_user
    set_pick
    unless current_user == @pick.user
      redirect_back fallback_location: root_path, alert: "You are not authorized for that."
    end
  end

    # Use callbacks to share common setup or constraints between actions.
    def set_pick
      @pick = Pick.find(params[:id])
    end

    # Only allow a trusted parameter "white list" through.
    def pick_params
      params.require(:pick).permit(:user_id, :game_id, :team, :weight)
    end
end
