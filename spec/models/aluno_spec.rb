require 'spec_helper'

describe Aluno do
  before do
    @aluno = FactoryGirl.create(:aluno)
  end
  
  subject { @aluno }
  
  it { should validate_presence_of :nome }
  it { should validate_presence_of :identidade }
  it { should validate_presence_of :nascimento }
  it { should validate_presence_of :telefone }
  
  it { should belong_to :turma }
  it { should have_many :boletins }
end
