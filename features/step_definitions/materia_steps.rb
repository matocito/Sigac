# Scenario List Materias
When /^I go to materias page$/ do
  visit administrador_materias_path
end

# Scenario Create Materia
When /^I go to the new materia page$/ do
  visit new_administrador_materia_path
end

And /^I create a materia$/ do
  fill_in('Nome', :with => 'Materia')
  click_button('Cadastrar')
end

Then /^I should be able to edit it$/ do
  visit edit_administrador_materia_path Materia.last
  find_field('Nome').value.should == 'Materia'
end

# Scenario Edit Materia
When /^I go to edit materia page$/ do
  visit edit_administrador_materia_path Materia.last
end

When /^I edit materia nome to "([^"]*)"$/ do |nome|
  fill_in('Nome', :with => nome)
  click_button('Salvar')
end

# Scenario Delete Materia
When /^I delete that materia$/ do
  click_link('Deletar')
end

Then /^I should not see "([^"]*)"$/ do |nome|
  page.should_not have_content nome
end

