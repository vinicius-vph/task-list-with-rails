require 'rails_helper'

describe Task, 'complete?' do
  it 'returns true if task completed_at is set' do
    task = Task.new(completed_at: Time.current)

    expect(task).to be_completed
  end
  it 'returns false if completed_at is nill' do
    task = Task.new(completed_at: nil)

    expect(task).not_to be_completed
  end
end

describe Task, 'completed!' do
  it 'update completed_at' do
    task = Task.create(completed_at: nil)

    task.completed!
    task.reload

    expect(task).to be_completed
  end
end

describe Task, 'incompleted!' do
  it 'update for incompleted' do
    task = Task.create(completed_at: Time.current)

    task.incompleted!
    task.reload

    expect(task).not_to be_completed
  end
end
