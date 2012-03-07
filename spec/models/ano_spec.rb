require 'spec_helper'

describe Ano do
  before do
    @ano = FactoryGirl.create(:ano)
  end
  
  it { should validate_numericality_of :ano }
  it { should have_many :turmas }
end
