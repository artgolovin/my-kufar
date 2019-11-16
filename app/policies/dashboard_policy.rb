class DashboardPolicy < Struct.new(:user, :dashboard)
  def administrator?
    # This code smells
    raise Pundit::NotAuthorizedError, "must be logged in" unless user
    user.role.name == 'administrator'
  end

  def user?
    # This code smells
    raise Pundit::NotAuthorizedError, "must be logged in" unless user
    user.role.name == 'user'
  end
end
