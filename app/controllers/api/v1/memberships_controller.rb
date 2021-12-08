class Api::V1::MembershipsController < Api::V1::GraphitiController
  def index
    memberships = MembershipResource.all(params)
    respond_with(memberships)
  end

  def show
    membership = MembershipResource.find(params)
    respond_with(membership)
  end

  def create
    membership = MembershipResource.build(params)

    if membership.save
      render jsonapi: membership, status: :created
    else
      render jsonapi_errors: membership
    end
  end

  def update
    membership = MembershipResource.find(params)

    if membership.update_attributes
      render jsonapi: membership
    else
      render jsonapi_errors: membership
    end
  end

  def destroy
    membership = MembershipResource.find(params)

    if membership.destroy
      render jsonapi: { meta: {} }, status: :ok
    else
      render jsonapi_errors: membership
    end
  end
end
