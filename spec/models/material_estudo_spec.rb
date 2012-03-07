require 'spec_helper'

describe MaterialEstudo do
  before do
    @material_estudo = Factory.create(:material_estudo)
  end
  
  subject { @material_estudo }
  
  it { should validate_presence_of :titulo }
  it { should validate_presence_of 'disciplina_professor_id' }
  
  it { should belong_to :disciplina_professor }
end
