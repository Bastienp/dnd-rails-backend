require 'rails_helper'

RSpec.describe User, type: :model do
  it "has a valid factory" do
    expect(build_stubbed(:user)).to be_valid
  end

  it "is invalid without firstname" do
    expect(build_stubbed(:user, firstname: nil)).to_not be_valid
  end

  it "is invalid without lastname" do
    expect(build_stubbed(:user, lastname: nil)).to_not be_valid
  end

  it "is invalid without job" do
    expect(build_stubbed(:user, job: nil)).to_not be_valid
  end

  it "is invalid without position" do
    expect(build_stubbed(:user, position: nil)).to_not be_valid
  end

  context :ordered_by_position do
    it "gets products without specific product" do
      to_meet = create(:to_meet)
      @alan = create(:alan, position: 1)
      @steve = create(:steve, list:to_meet, position: 2)
      expect(User.ordered_by_position).to eq([@alan, @steve])
    end
  end

end
