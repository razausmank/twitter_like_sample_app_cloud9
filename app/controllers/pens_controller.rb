class PensController < ApplicationController
  before_action :set_pen, only: [:show, :edit, :update, :destroy]

  respond_to :html

  def index
    @pens = Pen.all
    respond_with(@pens)
  end

  def show
    respond_with(@pen)
  end

  def new
    @pen = Pen.new
    respond_with(@pen)
  end

  def edit
  end

  def create
    @pen = Pen.new(pen_params)
    @pen.save
    respond_with(@pen)
  end

  def update
    @pen.update(pen_params)
    respond_with(@pen)
  end

  def destroy
    @pen.destroy
    respond_with(@pen)
  end

  private
    def set_pen
      @pen = Pen.find(params[:id])
    end

    def pen_params
      params.require(:pen).permit(:name, :email)
    end
end
