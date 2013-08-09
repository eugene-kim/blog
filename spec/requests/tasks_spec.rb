require 'spec_helper'

describe "Tasks" do
	before do
		@task = Task.create(name:"test task")
		visit tasks_path
	end

  describe "GET /tasks" do
  	it "displays some tasks" do
  		expect(page).to have_content "test task"
  	end

  	it "creates a new task" do
  		click_link "New Task"
  		expect(current_path).to eq(new_task_path)

  		fill_in 'Name', with: "task task task"
  		click_button "Create Task"

  		expect(current_path).to eq(tasks_path)
  		expect(page).to have_content "task task task"
  	end
  end

  describe "POST /tasks" do
  end

  describe "PUT /tasks" do
  end

  describe "DELETE /tasks" do
  	it "selected task should be deleted" do
  		find("#task_#{@task.id}").click_link("remove")
  		expect(page).not_to have_content "test task"
  	end
  end
end
