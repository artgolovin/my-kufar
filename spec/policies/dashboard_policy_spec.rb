require 'rails_helper'

RSpec.describe DashboardPolicy do
  subject { described_class }

  let(:user) { FactoryBot.create :user }
  let(:administrator) { FactoryBot.create :administrator }
  let(:guest) { nil }

  permissions :administrator? do
    it 'grants access if person is administrator' do
      expect(subject).to permit(administrator)
    end

    it 'denies access if person is user' do
      expect(subject).not_to permit(user)
    end

    # This code smells
    it 'denies access if person is not authorized' do
      expect{subject.new(guest).administrator?}.to raise_error(Pundit::NotAuthorizedError)
    end
  end

  permissions :user? do
    it 'grants access if person is user' do
      expect(subject).to permit(user)
    end

    it 'denies access if person is administrator' do
      expect(subject).not_to permit(administrator)
    end

    # This code smells
    it 'denies access if person is not authorized' do
      expect{subject.new(guest).user?}.to raise_error(Pundit::NotAuthorizedError)
    end
  end
end
