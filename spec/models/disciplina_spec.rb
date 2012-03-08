require 'spec_helper'

describe Disciplina do
  before do
    @disciplina = Factory.create(:disciplina)
  end
  
  subject { @disciplina }
  
  it { should belong_to :turma }
  it { should belong_to :materia }
  
  it { should validate_presence_of :turma_id }
  it { should validate_presence_of :materia_id }
  
  
  it { should have_many :disciplina_professores }
  it { should have_many(:professores).through(:disciplina_professores) }
end
