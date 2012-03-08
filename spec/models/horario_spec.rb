require 'spec_helper'

describe Horario do
  before do
    @horario = FactoryGirl.create(:horario)
  end
  
  subject { @horario }
  
  it { should belong_to :turma }
  it { should belong_to :disciplina_professor }
  it { should have_many :horas }
end
