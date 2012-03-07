require 'spec_helper'

describe Turma do
  before do
    @turma = Factory.create(:turma)
  end
  
  subject { @turma }
  
  it { should validate_presence_of :sala }
  
  it { should belong_to :serie }
  it { should have_many :disciplinas }
  it { should belong_to :ano }
  it { should have_many :alunos }
end
