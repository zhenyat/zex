require "test_helper"

class SampleTest < ActiveSupport::TestCase
  def setup
    @sample = Sample.new
  end

  context 'validations' do
    should validate_presence_of(:name)
    should validate_uniqueness_of(:name)
    should validate_presence_of(:title)
    should validate_presence_of(:price)
    should validate_numericality_of(:price).is_greater_than_or_equal_to(0.0)
    should validate_presence_of(:quantity)
    should validate_numericality_of(:quantity).only_integer.is_greater_than_or_equal_to(0)
  end

  # context 'a company' do
  #   should "be one active Company" do
  #     assert_equal 1, Company.active.count
  #   end
  # end
end

