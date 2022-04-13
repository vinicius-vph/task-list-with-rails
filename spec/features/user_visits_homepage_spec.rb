require 'rails_helper'

describe 'user visits homepage' do
  context 'successfully' do
    it 'should be able acces' do
      visit root_path

      expect(page).to have_css 'h1', text: 'Bem vindo ao Task List'
      expect(page).to have_css 'h3', text: 'Sua lista de tarefas'
      expect(page).to have_css 'a', text: '⚙️ Gerenciar Tarefas'
    end
  end
end
