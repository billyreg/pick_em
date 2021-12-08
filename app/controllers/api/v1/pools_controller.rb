class Api::V1::PoolsController < Api::V1::GraphitiController
  def index
    pools = PoolResource.all(params)
    respond_with(pools)
  end

  def show
    pool = PoolResource.find(params)
    respond_with(pool)
  end

  def create
    pool = PoolResource.build(params)

    if pool.save
      render jsonapi: pool, status: :created
    else
      render jsonapi_errors: pool
    end
  end

  def update
    pool = PoolResource.find(params)

    if pool.update_attributes
      render jsonapi: pool
    else
      render jsonapi_errors: pool
    end
  end

  def destroy
    pool = PoolResource.find(params)

    if pool.destroy
      render jsonapi: { meta: {} }, status: :ok
    else
      render jsonapi_errors: pool
    end
  end
end
