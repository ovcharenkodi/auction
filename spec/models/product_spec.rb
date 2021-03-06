require 'spec_helper'

describe Product do
  it { should respond_to(:description) }
  it { should validate_presence_of(:title) }
  it { should validate_uniqueness_of(:title) }
  it { should ensure_length_of(:title).is_at_least(4).is_at_most(120) }

  it { should respond_to(:price) }
  it { should validate_presence_of(:price) }
  it { should validate_numericality_of(:price).is_greater_than_or_equal_to BigDecimal.new('0.01') }

  it { should have_many(:lots).dependent(:destroy) }
  it { should belong_to(:category) }
  it { should validate_presence_of(:category) }
end