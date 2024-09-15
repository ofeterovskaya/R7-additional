require 'rails_helper'

RSpec.describe Order, type: :model do
  it { should belong_to(:customer) }
  
  it { should validate_presence_of(:product_name) }
  it { should validate_presence_of(:product_count) }
  it { should validate_presence_of(:customer) }
end
