class WeeksController < ApplicationController
  before_action :set_week, only: %i[show edit update destroy]

  def index
    @q = Week.ransack(params[:q])
    @weeks = @q.result(distinct: true).includes(:games, :pool,
                                                :picks).page(params[:page]).per(10)
  end

  def show
    @game = Game.new
  end

  def new
    @week = Week.new
  end

  def edit; end

  def create
    @week = Week.new(week_params)

    if @week.save
      message = "Week was successfully created."
      if Rails.application.routes.recognize_path(request.referer)[:controller] != Rails.application.routes.recognize_path(request.path)[:controller]
        redirect_back fallback_location: request.referer, notice: message
      else
        redirect_to @week, notice: message
      end
    else
      render :new
    end
  end

  def update
    if @week.update(week_params)
      redirect_to @week, notice: "Week was successfully updated."
    else
      render :edit
    end
  end

  def destroy
    @week.destroy
    message = "Week was successfully deleted."
    if Rails.application.routes.recognize_path(request.referer)[:controller] != Rails.application.routes.recognize_path(request.path)[:controller]
      redirect_back fallback_location: request.referer, notice: message
    else
      redirect_to weeks_url, notice: message
    end
  end

  private

  def set_week
    @week = Week.find(params[:id])
  end

  def week_params
    params.require(:week).permit(:pool_id, :name)
  end
end
