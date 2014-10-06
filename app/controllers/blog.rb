module Site
	module Routes
		class Blog < Sinatra::Application
			helpers Helpers

			get '/blog/?*' do
				jekyll_blog(request.path) { 404 }
			end

			private
				def jekyll_blog(path, &missing_file_block)
					@current_menu = "blog"
					@title = "Blog - Joshua LeBlanc"

					file_path = File.join(File.dirname(__FILE__), 'jekyll/_site',  path.gsub('/blog',''))
					file_path = File.join(file_path, 'index.html') unless file_path =~ /\.[a-z]+$/i
					p file_path
					if File.exist?(file_path)
						file = File.open(file_path, "rb")
						contents = file.read
						file.close

						if (file_path.include?('.xml') || file_path.include?('.css'))
							erb contents, :content_type => 'text/xml'
						else
							erb contents, :layout_engine => :haml
						end
					else
						haml :not_found
					end
				end

		end
	end
end