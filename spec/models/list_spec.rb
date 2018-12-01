require 'rails_helper'

RSpec.describe List, type: :model do
  it "has a valid factory" do
    expect(build_stubbed(:list)).to be_valid
  end

  it "is invalid without title" do
    expect(build_stubbed(:list, title: nil)).to_not be_valid
  end
end
