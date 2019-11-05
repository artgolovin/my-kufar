class ApplicationController < ActionController::Base
  before_action :set_locale

  private

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
