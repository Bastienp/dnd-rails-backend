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
end
