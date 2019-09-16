class CarsController < ApplicationController
  before_action :authorize_request, except: :create
  before_action :find_car, except: %i[create index]

  # GET /cars
  def index
    @cars = car.all
    render json: @cars, status: :ok
  end

  # GET /cars/{carname}
  def show
    render json: @car, status: :ok
  end

  # POST /cars
  def create
    @car = car.new(car_params)
    if @car.save
      render json: @car, status: :created
    else
      render json: { errors: @car.errors.full_messages },
             status: :unprocessable_entity
    end
  end

  # PUT /cars/{carname}
  def update
    unless @car.update(car_params)
      render json: { errors: @car.errors.full_messages },
             status: :unprocessable_entity
    end
  end

  # DELETE /cars/{carname}
  def destroy
    @car.destroy
  end

  private

  def find_car
    @car = car.find_by_carname!(params[:_carname])
    rescue ActiveRecord::RecordNotFound
      render json: { errors: 'car not found' }, status: :not_found
  end

  def car_params
    params.permit(
      :avatar, :name, :carname, :email, :password, :password_confirmation
    )
  end
end
