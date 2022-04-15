require 'rails_helper'

describe 'User incompletes task' do
  context 'succesfully' do
    it 'should be able incomplete task' do
      sign_in
      create_task 'Tomar café'
      click_on 'Marcar Completo'
      click_on 'Marcar Incompleto'

      expect(page).not_to display_completed_task 'Tomar café'
      expect(page).to display_task 'Tomar café'
    end
  end
end
