require 'spec_helper'

describe Season do
  describe 'attributes' do
    it { should have_db_column(:years).of_type(:string) }
    it { should have_db_column(:created_at).of_type(:datetime) }
    it { should have_db_column(:updated_at).of_type(:datetime) }
  end

  describe 'associations' do
    it { should have_many(:games) }
    it { should have_many(:ticket_holders) }
  end
end
