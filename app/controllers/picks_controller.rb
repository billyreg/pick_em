class PicksController < ApplicationController
  before_action :current_user_must_be_pick_user,
                only: %i[edit update destroy]

  before_action :set_pick, only: %i[show edit update destroy]

  def index
    @q = current_user.picks.ransack(params[:q])
    @picks = @q.result(distinct: true).includes(:user, :game,
                                                :team).page(params[:page]).per(10)
  end

  def show; end

  def new
    @pick = Pick.new
  end

  def edit; end

  def create
    @pick = Pick.new(pick_params)

    if @pick.save
      message = "Pick was successfully created."
      if Rails.application.routes.recognize_path(request.referer)[:controller] != Rails.application.routes.recognize_path(request.path)[:controller]
        redirect_back fallback_location: request.referer, notice: message
      else
        redirect_to @pick, notice: message
      end
    else
      render :new
    end
  end

  def update
    if @pick.update(pick_params)
      redirect_to @pick, notice: "Pick was successfully updated."
    else
      render :edit
    end
  end

  def destroy
    @pick.destroy
    message = "Pick was successfully deleted."
    if Rails.application.routes.recognize_path(request.referer)[:controller] != Rails.application.routes.recognize_path(request.path)[:controller]
      redirect_back fallback_location: request.referer, notice: message
    else
      redirect_to picks_url, notice: message
    end
  end

  private

  def current_user_must_be_pick_user
    set_pick
    unless current_user == @pick.user
      redirect_back fallback_location: root_path,
                    alert: "You are not authorized for that."
    end
  end

  def set_pick
    @pick = Pick.find(params[:id])
  end

  def pick_params
    params.require(:pick).permit(:user_id, :game_id, :team_id, :weight)
  end
end
