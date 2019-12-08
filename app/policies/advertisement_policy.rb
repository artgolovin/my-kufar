class AdvertisementPolicy < ApplicationPolicy
  def new?
    user?
  end

  def create?
    user?
  end

  def edit?
    owner? && @record.status == 'draft'
  end

  def update?
    owner? && @record.status == 'draft'
  end

  def destroy?
    owner? || (administrator? && @record.status == 'published')
  end
end
