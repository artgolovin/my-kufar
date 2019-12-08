require 'rails_helper'

RSpec.describe AdverTypePolicy do
  subject { described_class }

  let(:user) { FactoryBot.create :user }
  let(:administrator) { FactoryBot.create :administrator }

  let(:adver_type) { FactoryBot.create :adver_type }
  let(:denied_to_destroy_adver_type) do
    adver_type = FactoryBot.create :adver_type
    advers = [ FactoryBot.create(:advertisement, adver_type_id: adver_type.id) ]
    advers << HIDDEN_STATUSES.each_with_object([]) do |hidden_status, hidden_advers|
                hidden_advers << FactoryBot.create(:advertisement,
                                                   status: hidden_status,
                                                   adver_type_id: adver_type.id)
                end
    adver_type
  end

  permissions :index?, :new?, :create?, :edit?, :update? do
    it 'denies access if person is user' do
      expect(subject).not_to permit(user, adver_type)
    end

    it 'grant access if person is adminitrator' do
      expect(subject).to permit(administrator, adver_type)
    end
  end

  permissions :destroy? do
    context 'when person is user' do
      it 'denies access' do
        expect(subject).not_to permit(user, adver_type)
      end
    end

    context 'when person is administrator' do
      context 'when there are advertisements of this type' do
        it 'denies access' do
          expect(subject).not_to permit(administrator, denied_to_destroy_adver_type)
        end
      end

      context 'when there are no advertisement of this type' do
        it 'allows access' do
          expect(subject).to permit(administrator, adver_type)
        end
      end
    end
  end

  # I'm his code, HELP ME
  describe 'new?, create?, edit?, update?, destroy?' do
    context 'guest user' do
      let(:police_class) { described_class.new(guest, AdverType) }
      let(:guest) { nil }

      it 'denies access if person is guest for index?' do
        expect{police_class.index?}.to raise_error(Pundit::NotAuthorizedError)
      end
      it 'denies access if person is guest for new?' do
        expect{police_class.new?}.to raise_error(Pundit::NotAuthorizedError)
      end
      it 'denies access if person is guest for create?' do
        expect{police_class.create?}.to raise_error(Pundit::NotAuthorizedError)
      end
      it 'denies access if person is guest for edit?' do
        expect{police_class.edit?}.to raise_error(Pundit::NotAuthorizedError)
      end
      it 'denies access if person is guest update?' do
        expect{police_class.update?}.to raise_error(Pundit::NotAuthorizedError)
      end
      it 'denies access if person is guest for destroy?' do
        expect{police_class.destroy?}.to raise_error(Pundit::NotAuthorizedError)
      end
    end
  end
end
