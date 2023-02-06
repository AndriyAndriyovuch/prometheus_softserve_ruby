require "test_helper"

class CategoryTest < ActiveSupport::TestCase

  test "test first category" do
    cat = Category.first
    assert true
  end
end
