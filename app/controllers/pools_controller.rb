class PoolsController < ApplicationController
  before_action :set_pool, only: %i[show edit update destroy]

  def index
    @q = Pool.ransack(params[:q])
    @pools = @q.result(distinct: true).includes(:weeks, :memberships,
                                                :members).page(params[:page]).per(10)
  end

  def show
    @membership = Membership.new
    @week = Week.new
  end

  def new
    @pool = Pool.new
  end

  def edit; end

  def create
    @pool = Pool.new(pool_params)

    if @pool.save
      redirect_to @pool, notice: "Pool was successfully created."
    else
      render :new
    end
  end

  def update
    if @pool.update(pool_params)
      redirect_to @pool, notice: "Pool was successfully updated."
    else
      render :edit
    end
  end

  def destroy
    @pool.destroy
    redirect_to pools_url, notice: "Pool was successfully destroyed."
  end

  private

  def set_pool
    @pool = Pool.find(params[:id])
  end

  def pool_params
    params.require(:pool).permit(:name)
  end
end
