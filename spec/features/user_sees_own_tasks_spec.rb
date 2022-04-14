require 'rails_helper'

describe 'User sees own taks' do
  context "doesn't sees others" do
    it 'should not be able see task from another user' do
      Task.create!(description: 'Tomar café', email: 'vdsantos@primeit.pt')

      sign_in_as 'vinicius.vph@gmail.com'

      expect(page).not_to display_task 'Tomar café'
    end
  end
end
