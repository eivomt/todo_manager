require_relative "task"
require_relative "tasks_view"

class TasksController
  attr_accessor :name

  def initialize(repository)
    @repository = repository
    @view = TasksView.new
  end

  def list
    tasks = @repository.all
    @view.display(tasks)
  end

  def create
    description = @view.ask_user_for_description
    task = Task.new(description)
    @repository.add(task)
  end

  def mark_as_done
    list
    index = @view.ask_user_for_index
    task = @repository.find(index)
    task.mark_as_done!
  end

  def destroy
    list
    index = @view.ask_user_for_index
    @repository.remove(index)
  end
end
