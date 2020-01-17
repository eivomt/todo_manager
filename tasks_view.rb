class TasksView
  def display(tasks)
    tasks.each_with_index do |task, index|
      done = task.done? ? "[x]" : "[ ]"
      puts "#{done} #{index + 1}. #{task.description}"
    end
  end

  def ask_user_for_description
    puts "What's the task?"
    gets.chomp
  end

  def ask_user_for_index
    puts "What's the index of the task?"
    gets.chomp.to_i - 1
  end
end
