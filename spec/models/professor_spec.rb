require 'spec_helper'

describe Professor do
  before do
    @professor = Factory.create(:professor)
  end
  
  subject { @professor }
  
  it { should validate_presence_of :nome }
  it { should_not allow_value('1111111111').for :cpf }
  it { should validate_presence_of :nascimento }
  it { should validate_presence_of :telefone }
  
  it { should have_many :disciplina_professores }
  it { should have_many(:materiais_estudo).through :disciplina_professores }
  it { should have_many(:avaliacoes).through :disciplina_professores }
  it { should have_one :usuario }

end
