class AdverTypesController < ApplicationController
  before_action :authenticate_user!
  before_action :set_adver_type, only: %i[edit update destroy]

  def index
    authorize AdverType
    @adver_types = paginate AdverType.all.includes(:advertisements)
  end

  def new
    authorize AdverType

    @adver_type = AdverType.new
  end

  def create
    authorize AdverType

    @adver_type = AdverType.create adver_type_params
    if @adver_type.valid?
      redirect_to :dashboard_adver_types, notice: 'Successfully Created'
    else
      render :new
    end
  end

  def edit
    authorize @adver_type
  end

  def update
    authorize @adver_type

    if @adver_type.update adver_type_params
      redirect_to :dashboard_adver_types, notice: 'Successfully Updated'
    else
      render :edit
    end
  end

  def destroy
    authorize @adver_type

    @adver_type.destroy
    redirect_to :dashboard_adver_types, notice: 'Successfully Destroyed'
  end

  private

  def set_adver_type
    @adver_type = AdverType.find params[:id].to_i
  end

  def adver_type_params
    params.require(:adver_type).permit(:name)
  end
end
