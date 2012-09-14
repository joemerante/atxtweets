module ApplicationHelper
	def display_twitter_name(text)
		#auto_link gem converts url text to hyperlinks
		auto_link text.gsub(/@([a-z0-9_]+)/i, %Q{<a href="http://twitter.com/\\1">\@\\1</a>})
	end

	def display_hashtag(text)
    auto_link text.gsub(/#([a-z0-9_]+)/i, %Q{<a href="http://twitter.com/search/\\1">\#\\1</a>})
	end
end
