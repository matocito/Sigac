require 'spec_helper'

describe Boletim do
  before do
    @boletim = FactoryGirl.create(:boletim)
  end
  
  subject { @boletim }
  
  it { should validate_numericality_of :media }
  it { should validate_numericality_of :frequencia }
  it { should validate_numericality_of :bimestre }
  it { should validate_numericality_of :ano }
  it { should validate_presence_of :disciplina }
  it { should validate_presence_of :serie }
  
  it { should belong_to :aluno }
end
