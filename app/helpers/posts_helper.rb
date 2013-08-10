module PostsHelper
	def post_date(datetime)
		datetime.strftime("%b %d, %Y")
	end
end
