class Textbook
	def initialize(options = {})
	end
	def insert(page)
		@pages ||= []
		@pages << page
	end
	def to_s
		@pages.each do |page|
		"Header: #{page.header}\nTime: #{page.timestamp}\nArticle: #{page.article}"
		end	
	end
end