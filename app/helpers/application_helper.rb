module ApplicationHelper
	def display_twitter_name(text)
		# matches = text.scan(/@([a-z0-9_]+)/i)
		# matches.each do |match| 
		# 	@string = match.to_s
		# 	#@string.gsub(@string, '<a href="https://twitter.com/<%= @string %>">@string</a>')
		# end
		auto_link text.gsub(/@([a-z0-9_]+)/i, %Q{<a href="http://twitter.com/\\1">\@\\1</a>})
	end

	def display_hashtag(text)
		# matches = text.scan(/#([a-z0-9_]+)/i) #take the tweet and return an array of matches as arrays
		#  matches.each do |match| 
		#  	@string = match.to_s #convert each matched array to a string then substitute for it
		#  	@string.gsub(@string, '<a href="https://twitter.com/search/<%= @string %>">@string</a>')
		#  	puts text
		#  end
		
    auto_link text.gsub(/#([a-z0-9_]+)/i, %Q{<a href="http://twitter.com/search/\\1">\#\\1</a>})
  	

	end
end
