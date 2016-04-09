require "pry"

require "rspec"

require "./todo"

RSpec.describe "todo" do 

	before (:all) do
		 @task = Task.new("Text")
	end

	it "Confirms that a task incomplete when first created" do
      expect(@task.complete?).to eq(false)
    end

    it "Indicates that a task has been completed" do
      @task.complete!
      expect(@task.complete?).to eq(true)
    end

	it "Indicates that a completed task has been corrected to incomplete" do
      @task.complete!
      @task.incomplete!
      expect(@task.complete?).to eq(false)
    end

	it "Indicates that the time a new task has been created is recorded" do
      expect(@task.created_at).to be_truthy
    end

	it "Indicates that a task has successfully been updated" do
      expect(@task.update_content!("Text")).not_to eq(@task)
    end

	it "Indicates that a task has successfully been added to a list" do
      @list = TodoList.new
      expect(@list.add_task("task1")).not_to eq(@list)
    end

	it "Indicates that a task has successfully been deleted from a list" do
      @list = TodoList.new
      @list.add_task(@task)
      # @list.add_task(task2)
       # binding.pry
      @list.delete_task(3)
      expect(@list.tasks.length).to eq(0)
    end

	it "identifies a task correctly by its id" do
		@list = TodoList.new
		@list.add_task(@task)
		# binding.pry
		expect(@list.tasks[0].content).to eq("Text")
	end

end