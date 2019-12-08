class AdsController < ApplicationController
  before_action :set_advertisement, only: %i[show edit update destroy]
  before_action :authenticate_user!, only: %i[new create edit update destroy change_status]

  def index
    @ads = paginate PublishedAdsQuery.find
  end

  def show; end

  def new
    authorize Advertisement
    @adver = Advertisement.new
  end

  def create
    authorize Advertisement

    @adver = Advertisement.create adver_params
    if @adver.valid?
      redirect_to dashboard_ads_url(adver_status: :draft), notice: 'Successfully Created'
    else
      render :new
    end
  end

  def edit
    authorize @adver
  end

  def update
    authorize @adver

    if @adver.update(adver_params)
      redirect_to dashboard_ads_url(adver_status: :draft), notice: 'Successfully Updated'
    else
      render :edit
    end
  end

  def destroy
    authorize @adver

    @adver.destroy
    redirect_back fallback_location: dashboard_ads_url(adver_status: :draft), notice: 'Successfully Destroyed'
  end

  # Auth for this action is done inside Advertisement's state machine
  def change_status
    @adver = Advertisement.find params[:advertisement_id]

    if @adver.send params[:status_action], current_user
      redirect_to :dashboard, notice: "Successfully #{params[:status_action]}"
    else
      redirect_to :dashboard, alert: 'Something Wrong'
    end
  end

  private

  def set_advertisement
    @adver = Advertisement.find params[:id].to_i
  end

  def updated_adver_params
    h1 = { adver_type_id: params.require(:advertisement)[:adver_type_id].to_i }
    params.merge h1
  end

  def adver_params
    updated_adver_params.require(:advertisement).permit(:title, :description, :adver_type_id, :image).merge(user_id: user_id)
  end

  def user_id
    current_user.id
  end
end
