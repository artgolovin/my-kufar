class Advertisement < ActiveRecord::Base
  belongs_to :user
  belongs_to :adver_type

  validates_presence_of :title
  validates_presence_of :description

  has_one_attached :image

  include AASM

  aasm column: :status, whiny_transitions: true do
    state :draft, :new, :rejected, :approved, :published, :archived

    event :send_to_moderation do
      transitions from: :draft, to: :new, guard: :owner?
    end

    event :reject do
      transitions from: :new, to: :rejected, guard: :administrator?
    end

    event :approve do
      transitions from: :new, to: :approved, guard: :administrator?
    end

    event :publish do
      transitions from: :approved, to: :published
    end

    event :archive do
      transitions from: :published, to: :archived
    end

    event :draft_again do
      transitions from: %i[rejected archived], to: :draft, guard: :owner?
    end
  end

  def owner?(person)
    person.id == user_id
  end

  def administrator?(person)
    person.role.name == 'administrator'
  end
end
