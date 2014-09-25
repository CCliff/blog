class Page
	def initialize(options={})
		@header = options["header"]
		@article = options["article"]
		@timestamp = options["timestamp"]
	end
	def header
		@header ||= ""
	end
	def header=(new_header)
		@header = new_header
	end
	def article
		@article ||= ""
	end
	def article=(new_article)
		@article = new_article
	end
	def timestamp
		@timestamp
	end
	def timestamp=(new_timestamp)
		@timestamp = new_timestamp
	end
	def to_s
		"Header: #{header}\nTime: #{timestamp}\nArticle: #{article}"
	end
end