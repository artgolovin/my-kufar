class ApplicationController < ActionController::Base
  private

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
