require 'rails_helper'

RSpec.describe AdverType, type: :model do
  it { should validate_presence_of(:name) } 
end
