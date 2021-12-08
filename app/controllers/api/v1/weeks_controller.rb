class Api::V1::WeeksController < Api::V1::GraphitiController
  def index
    weeks = WeekResource.all(params)
    respond_with(weeks)
  end

  def show
    week = WeekResource.find(params)
    respond_with(week)
  end

  def create
    week = WeekResource.build(params)

    if week.save
      render jsonapi: week, status: :created
    else
      render jsonapi_errors: week
    end
  end

  def update
    week = WeekResource.find(params)

    if week.update_attributes
      render jsonapi: week
    else
      render jsonapi_errors: week
    end
  end

  def destroy
    week = WeekResource.find(params)

    if week.destroy
      render jsonapi: { meta: {} }, status: :ok
    else
      render jsonapi_errors: week
    end
  end
end
