require 'rails_helper'

RSpec.describe User, type: :model do
  pending "add some examples to (or delete) #{__FILE__}"
end
require 'rails_helper'

RSpec.describe User, type: :model do
  describe "associations" do
    it { should have_many(:boards) }
    it { should have_many(:contexts).through(:boards) }
    it { should have_many(:tasks).through(:contexts) }
  end

  describe "enums" do
    it { should define_enum_for(:active).with_values(inactive: 0, active: 1) }
  end

  describe "callbacks" do
    it { should callback(:create_default_board).after(:create) }
  end

  describe "methods" do
    let(:user) { User.new }

    describe "#send_password_reset" do
      it "generates password reset token and sends email" do
        expect(user).to receive(:generate_token).with(:password_reset_token)
        expect(user).to receive(:save!)
        expect(UserMailer).to receive(:password_reset).with(user).and_return(double(deliver: true))

        user.send_password_reset
      end
    end

    describe "#generate_token" do
      it "generates a unique token for the given column" do
        expect(SecureRandom).to receive(:urlsafe_base64).and_return("token")
        expect(User).to receive(:exists?).with(password_reset_token: "token").and_return(false)

        user.generate_token(:password_reset_token)

        expect(user.password_reset_token).to eq("token")
      end
    end

    describe "#create_default_board" do
      it "creates default boards for the user" do
        expect(user).to receive(:boards).and_return(double(insert_all: true))
        expect(user).to receive(:default_boards).and_return([
          { name: "Domésticas", description: "Board para tarefas domésticas" },
          { name: "Profissionais", description: "Board para tarefas profissionais" },
          { name: "Estudos", description: "Board para tarefas de estudos" },
          { name: "Lazer", description: "Board para tarefas de lazer" }
        ])

        user.create_default_board
      end
    end

    describe "#default_boards" do
      it "returns an array of default boards" do
        expect(user.default_boards).to eq([
          { name: "Domésticas", description: "Board para tarefas domésticas" },
          { name: "Profissionais", description: "Board para tarefas profissionais" },
          { name: "Estudos", description: "Board para tarefas de estudos" },
          { name: "Lazer", description: "Board para tarefas de lazer" }
        ])
      end
    end
  end
end