require 'rails_helper'

describe 'User updates own taks' do
  context 'successfully' do
    it 'should not be able see task from another user' do
      sign_in
      create_task 'Tomar café'
      click_on '❌'

      expect(page).not_to display_task 'Tomar café'
    end
  end
end
