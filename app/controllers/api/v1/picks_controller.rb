class Api::V1::PicksController < Api::V1::GraphitiController
  def index
    picks = PickResource.all(params)
    respond_with(picks)
  end

  def show
    pick = PickResource.find(params)
    respond_with(pick)
  end

  def create
    pick = PickResource.build(params)

    if pick.save
      render jsonapi: pick, status: 201
    else
      render jsonapi_errors: pick
    end
  end

  def update
    pick = PickResource.find(params)

    if pick.update_attributes
      render jsonapi: pick
    else
      render jsonapi_errors: pick
    end
  end

  def destroy
    pick = PickResource.find(params)

    if pick.destroy
      render jsonapi: { meta: {} }, status: 200
    else
      render jsonapi_errors: pick
    end
  end
end
