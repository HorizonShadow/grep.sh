module Site
	module Helpers
		def render_partial(template)
			haml template, :partial => false
		end

		def render_social_link(url)
			@url = url
			@name = url.match(/(\.)(.*)(\.)/)[2].capitalize
			@img_loc = "/img/icons/#{@name}/#{@name}-256.png"
			haml :social_link, partial: false
		end

		def render_menu_link(loc, img)
			@loc = loc
			@img = img
			haml :menu_link, partial: false
		end

		def render_project_preview(file, name, body)
			@file = file
			@name = name
			@body = body
			haml :project_preview, partial: false
		end
	end
end
