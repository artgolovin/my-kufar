# NEEDS TO DRY
require 'rails_helper'

RSpec.describe AdvertisementPolicy do
  subject { described_class }

  let(:guest) { nil }
  let(:user) { FactoryBot.create :user }
  let(:administrator) { FactoryBot.create :administrator }
  let(:advertisement_owner) { FactoryBot.create :user }

  let(:published_advertisement) { FactoryBot.create :advertisement, user_id: advertisement_owner.id }
  let(:draft_advertisement) { FactoryBot.create :draft_advertisement, user_id: advertisement_owner.id }
  let(:new_advertisement) { FactoryBot.create :new_advertisement, user_id: advertisement_owner.id }
  let(:rejected_advertisement) { FactoryBot.create :rejected_advertisement, user_id: advertisement_owner.id }
  let(:approved_advertisement) { FactoryBot.create :approved_advertisement, user_id: advertisement_owner.id }
  let(:archived_advertisement) { FactoryBot.create :archived_advertisement, user_id: advertisement_owner.id }


  permissions :new?, :create? do
    it 'grant access if person is user' do
      expect(subject).to permit(user)
    end

    it 'denies access if person is adminitrator' do
      expect(subject).not_to permit(administrator)
    end
  end

  permissions :edit?, :update? do
    describe 'Draft Advertisement' do
      context "when user is adver's owner" do
        it 'grant access' do
          expect(subject).to permit(advertisement_owner, draft_advertisement)
        end
      end

      context "when user is not adver's owner" do
        it 'denies access when person is user' do
          expect(subject).not_to permit(user, draft_advertisement)
        end

        it 'denies access when person is adminitstrator' do
          expect(subject).not_to permit(administrator, draft_advertisement)
        end
      end
    end

    describe 'New Advertisement' do
      context "when user is adver's owner" do
        it 'denies access' do
          expect(subject).not_to permit(advertisement_owner, new_advertisement)
        end
      end

      context "when user is not adver's owner" do
        it 'denies access when person is user' do
          expect(subject).not_to permit(user, new_advertisement)
        end

        it 'denies access when person is adminitstrator' do
          expect(subject).not_to permit(administrator, new_advertisement)
        end
      end
    end

    describe 'Rejected Advertisement' do
      context "when user is adver's owner" do
        it 'denies access' do
          expect(subject).not_to permit(advertisement_owner, rejected_advertisement)
        end
      end

      context "when user is not adver's owner" do
        it 'denies access when person is user' do
          expect(subject).not_to permit(user, rejected_advertisement)
        end

        it 'denies access when person is adminitstrator' do
          expect(subject).not_to permit(administrator, rejected_advertisement)
        end
      end
    end

    describe 'Approved Advertisement' do
      context "when user is adver's owner" do
        it 'denies access' do
          expect(subject).not_to permit(advertisement_owner, approved_advertisement)
        end
      end

      context "when user is not adver's owner" do
        it 'denies access when person is user' do
          expect(subject).not_to permit(user, approved_advertisement)
        end

        it 'denies access when person is adminitstrator' do
          expect(subject).not_to permit(administrator, approved_advertisement)
        end
      end
    end

    describe 'Published Advertisement' do
      context "when user is adver's owner" do
        it 'denies access' do
          expect(subject).not_to permit(advertisement_owner, published_advertisement)
        end
      end

      context "when user is not adver's owner" do
        it 'denies access when person is user' do
          expect(subject).not_to permit(user, published_advertisement)
        end

        it 'denies access when person is adminitstrator' do
          expect(subject).not_to permit(administrator, published_advertisement)
        end
      end
    end

    describe 'Archived Advertisement' do
      context "when user is adver's owner" do
        it 'denies access' do
          expect(subject).not_to permit(advertisement_owner, archived_advertisement)
        end
      end

      context "when user is not adver's owner" do
        it 'denies access when person is user' do
          expect(subject).not_to permit(user, archived_advertisement)
        end

        it 'denies access when person is adminitstrator' do
          expect(subject).not_to permit(administrator, archived_advertisement)
        end
      end
    end
  end

  permissions :destroy? do
    describe 'Draft Advertisement' do
      context "when user is adver's owner" do
        it 'grant access' do
          expect(subject).to permit(advertisement_owner, draft_advertisement)
        end
      end

      context "when user is not adver's owner" do
        it 'denies access when person is user' do
          expect(subject).not_to permit(user, draft_advertisement)
        end

        it 'denies access when person is adminitstrator' do
          expect(subject).not_to permit(administrator, draft_advertisement)
        end
      end
    end

    describe 'New Advertisement' do
      context "when user is adver's owner" do
        it 'grant access' do
          expect(subject).to permit(advertisement_owner, new_advertisement)
        end
      end

      context "when user is not adver's owner" do
        it 'denies access when person is user' do
          expect(subject).not_to permit(user, new_advertisement)
        end

        it 'denies access when person is adminitstrator' do
          expect(subject).not_to permit(administrator, new_advertisement)
        end
      end
    end

    describe 'Rejected Advertisement' do
      context "when user is adver's owner" do
        it 'grant access' do
          expect(subject).to permit(advertisement_owner, rejected_advertisement)
        end
      end

      context "when user is not adver's owner" do
        it 'denies access when person is user' do
          expect(subject).not_to permit(user, rejected_advertisement)
        end

        it 'denies access when person is adminitstrator' do
          expect(subject).not_to permit(administrator, rejected_advertisement)
        end
      end
    end

    describe 'Approved Advertisement' do
      context "when user is adver's owner" do
        it 'grant access' do
          expect(subject).to permit(advertisement_owner, approved_advertisement)
        end
      end

      context "when user is not adver's owner" do
        it 'denies access when person is user' do
          expect(subject).not_to permit(user, approved_advertisement)
        end

        it 'denies access when person is adminitstrator' do
          expect(subject).not_to permit(administrator, approved_advertisement)
        end
      end
    end

    describe 'Published Advertisement' do
      context "when user is adver's owner" do
        it 'grant access' do
          expect(subject).to permit(advertisement_owner, published_advertisement)
        end
      end

      context "when user is not adver's owner" do
        it 'denies access when person is user' do
          expect(subject).not_to permit(user, published_advertisement)
        end

        it 'grant access when person is adminitstrator' do
          expect(subject).to permit(administrator, published_advertisement)
        end
      end
    end

    describe 'Archived Advertisement' do
      context "when user is adver's owner" do
        it 'grant access' do
          expect(subject).to permit(advertisement_owner, archived_advertisement)
        end
      end

      context "when user is not adver's owner" do
        it 'denies access when person is user' do
          expect(subject).not_to permit(user, archived_advertisement)
        end

        it 'denies access when person is adminitstrator' do
          expect(subject).not_to permit(administrator, archived_advertisement)
        end
      end
    end
  end

  # I'm his code, HELP ME
  describe 'new?, create?, edit?, update?, destroy?' do
    context 'guest user' do
      let(:police_class) { described_class.new(guest, Advertisement) }
      let(:guest) { nil }

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
