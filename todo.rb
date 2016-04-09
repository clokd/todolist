class Task
    attr_reader :content, :id, :created_at, :updated_at
    @@current_id = 1
    def initialize(content)
        @content = content
        @complete = false
        @created_at = Time.new
        @updated_at = ()
        @id = @@current_id
        @@current_id += 1
    end

    def complete?
    	@complete	
    end

    def complete!
    	@complete = true
    end

	def incomplete!
    	@complete = false
    end

    def update_content!(content)
    	@content = content
    	@updated_at = Time.new
    	end

end


class TodoList
	# so we can create objects from this class i.e. a new todo list. 
	# each object contains an array that is the tasks

    attr_reader :tasks

    def initialize(user)
    	@user = user
        @tasks = []
    end

    def add_task(task)
    	@tasks.push(task)
    end

    def delete_task(id)
    	@tasks.delete_if {|x| x.id == id}
    end

    def find_task_by_id(id)
    	@tasks.each do |x|
    		if x.id = id
    			puts @tasks.content
    	end
    end
end

	def sort_by_created
		@tasks.sort {|task1, task2| task1.created_at <=> task2.created_at}
	end

end

task1 = Task.new("Buy the milk")
# puts task1.id
# puts task1.created_at
# puts task.complete?

task2 = Task.new("Wash the car")
# puts task2.id
# task2.complete!
# puts task2.complete?

# task2.incomplete!
# puts task2.complete?

# task = Task.new("Buy the dog")
# puts task.content
# puts task.created_at
# puts task.updated_at
# Buy the dog

todo_list = TodoList.new("Josh")

todo_list.add_task(task1)
todo_list.add_task(task2)


 todo_list.sort_by_created.each do |task|
 	puts task.content
 end
