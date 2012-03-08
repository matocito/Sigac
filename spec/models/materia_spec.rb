require 'spec_helper'

describe Materia do
  before do
    @materia = Factory.create(:materia)
  end
  
  subject { @materia }
  
  it { should validate_presence_of :nome }
  
  it { should validate_uniqueness_of :nome }
  
  it { should have_and_belong_to_many :series }
  it { should have_many :disciplinas }
  
end
