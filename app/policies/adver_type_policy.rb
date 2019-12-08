class AdverTypePolicy < ApplicationPolicy
  def index?
    administrator?
  end

  def new?
    administrator?
  end

  def create?
    administrator?
  end

  def edit?
    administrator?
  end

  def update?
    administrator?
  end

  def destroy?
    administrator? && @record.advertisements.empty?
  end
end
