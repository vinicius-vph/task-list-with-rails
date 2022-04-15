require 'rails_helper'

describe 'User creates a task' do
  context 'successfully' do
    it 'should be able creates a task' do
      sign_in
      create_task 'Tomar café'

      expect(page).to display_task 'Tomar café'
    end
  end
end
