require 'rails_helper'

describe 'User creates a todo' do
  context 'successfully' do
    it 'should be able creates a todo' do
      sign_in
      create_task 'Tomar café'

      expect(page).to display_task 'Tomar café'
    end
  end
end
