require 'rails_helper'

RSpec.describe List, type: :model do
  it "has a valid factory" do
    expect(build_stubbed(:list)).to be_valid
  end

  it "is invalid without title" do
    expect(build_stubbed(:list, title: nil)).to_not be_valid
  end

  it "is invalid without step" do
    expect(build_stubbed(:list, step: nil)).to_not be_valid
  end

  it "is invalid if step already exists" do
    create(:list, step: 'test')
    expect(build_stubbed(:list, step: 'test')).to_not be_valid
  end
end
