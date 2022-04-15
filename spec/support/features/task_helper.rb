module Features
  def create_task(task_title)
    fill_in 'Descrição da Tarefa',	with: task_title
    click_on 'Criar'
  end

  def display_task(task_title)
    have_css 'li.list-group-item', text: task_title
  end

  def display_completed_task(task_title)
    have_css 'li.completed', text: task_title
  end

  def update_task(task_title)
    visit tasks_path
    click_on '✏️'
    fill_in 'Descrição da Tarefa',	with: task_title
    click_on 'Atualizar'
  end
end
