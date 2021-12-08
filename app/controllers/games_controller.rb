class GamesController < ApplicationController
  before_action :set_game, only: %i[show edit update destroy]

  def index
    @q = Game.ransack(params[:q])
    @games = @q.result(distinct: true).includes(:picks).page(params[:page]).per(10)
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
      redirect_to @game, notice: "Game was successfully created."
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
    redirect_to games_url, notice: "Game was successfully destroyed."
  end

  private

  def set_game
    @game = Game.find(params[:id])
  end

  def game_params
    params.require(:game).permit(:favorite, :underdog, :description)
  end
end
