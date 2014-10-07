module Site
	module Routes
		class Index < Sinatra::Application
			helpers Helpers

			get '/' do
				user = SimpleRSS.parse open("http://stackoverflow.com/feeds/user/2424975")
				@answers = user.entries.select { |i| i.title.include? "Answer"}.first(5)
				@answers.map! do |answer|
					answer[:summary] = get_first_paragraph(answer)
					answer[:title] = title_without_name(answer)
					answer
				end
				haml :index
			end

			private
				def get_first_paragraph(answer)
					split_on = "\n"
					"#{split_on}#{answer.summary.split(split_on)[0]}"
				end

				def title_without_name(answer)
					answer.title.gsub("Answer by Cereal for", "")
				end
		end
	end
end


