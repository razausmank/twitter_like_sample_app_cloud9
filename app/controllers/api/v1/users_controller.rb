
module Api::V1
  class UsersController < ApiController
  respond_to :json

    # POST /v1/users
    def index
      respond_with User.all
    end

  end
end