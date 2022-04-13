require 'rails_helper'

describe 'User creates a todo' do
  context 'successfully' do
    it 'should be able creates a todo' do
      visit new_task_path

      fill_in 'Descrição da Tarefa',	with: 'Tomar café'
      check 'Status'
      click_on 'Criar'

      expect(page).to have_css 'li.list-group-item', text: "Tomar café"
    end
  end
end
