require 'rails_helper'

describe 'User completes task' do
  context 'succesfully' do
    it 'should be able complete task' do
      sign_in
      create_task 'Tomar café'
      click_on 'Marcar Completo'

      expect(page).to display_completed_task 'Tomar café'
    end
  end
end
