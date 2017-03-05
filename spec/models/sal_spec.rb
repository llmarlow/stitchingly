require 'rails_helper'

RSpec.describe Sal, type: :model do
  before do
    @sal = Sal.create(name: "Fantasy SAL", company: "Lakeside Needlecraft")
  end

  describe 'validations' do
    it 'cannot be created without a name' do
      @sal.name = nil
      expect(@sal).to_not be_valid
    end
  end

  it 'cannot be created without a company' do
    @sal.company = nil
    expect(@sal).to_not be_valid
  end

  it 'should have a unique name' do
    Sal.create!(:name=>"Foo", :company=>"company")
    foo = Sal.new(:name=>"Foo", :company=>"company")
    foo.should_not be_valid
  end
end
