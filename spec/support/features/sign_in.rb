module Features
  def sign_in
    sign_in_as 'admin@ror.com'
  end

  def sign_in_as(email)
    visit tasks_path
    click_on '✔️ Criar Nova Tarefa'

    fill_in 'Email',	with: email
    fill_in 'Senha',	with: 'rubyonrails'
    click_on 'Logar'
  end
end
