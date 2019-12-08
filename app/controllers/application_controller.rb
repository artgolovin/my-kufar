class ApplicationController < ActionController::Base
  include Pundit
  rescue_from Pundit::NotAuthorizedError, with: :user_not_authorized
  rescue_from ActiveRecord::RecordNotFound, with: :record_not_found

  before_action :set_locale

  private

  def record_not_found
    flash[:alert] = "YOU ARE TRYING TO ACCESS SMTHNG, THAT DOES'NT EXIST"
    redirect_to :root
  end

  def user_not_authorized
    flash[:alert] = 'YOU SHALL NOT PASS'
    redirect_to :root
  end

  def set_locale
    I18n.locale = params[:locale] if params[:locale]
  end

  def default_url_options(*)
    { locale: I18n.locale }
  end

  # :reek:FeatureEnvy
  def paginate(relation)
    paginated_relation = relation.page params[:page].to_i

    if paginated_relation.out_of_range?
      relation.page 1
    else
      paginated_relation
    end
  end
end
