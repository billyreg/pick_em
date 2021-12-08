class GamesController < ApplicationController
  before_action :set_game, only: %i[show edit update destroy]

  def index
    @q = Game.ransack(params[:q])
    @games = @q.result(distinct: true).includes(:picks, :week, :favorite,
                                                :underdog).page(params[:page]).per(10)
  end

  def show
    @pick = Pick.new
  end

  def new
    @game = Game.new
  end

  def edit; end

  def create
    @game = Game.new(game_params)

    if @game.save
      message = "Game was successfully created."
      if Rails.application.routes.recognize_path(request.referer)[:controller] != Rails.application.routes.recognize_path(request.path)[:controller]
        redirect_back fallback_location: request.referer, notice: message
      else
        redirect_to @game, notice: message
      end
    else
      render :new
    end
  end

  def update
    if @game.update(game_params)
      redirect_to @game, notice: "Game was successfully updated."
    else
      render :edit
    end
  end

  def destroy
    @game.destroy
    message = "Game was successfully deleted."
    if Rails.application.routes.recognize_path(request.referer)[:controller] != Rails.application.routes.recognize_path(request.path)[:controller]
      redirect_back fallback_location: request.referer, notice: message
    else
      redirect_to games_url, notice: message
    end
  end

  private

  def set_game
    @game = Game.find(params[:id])
  end

  def game_params
    params.require(:game).permit(:favorite_id, :underdog_id, :description,
                                 :week_id)
  end
end
