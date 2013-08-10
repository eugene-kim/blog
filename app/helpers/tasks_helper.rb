module TasksHelper
	def completed_on(task)
		if task.complete?
			"Completed on #{task.updated_at}"
		end
	end
end
