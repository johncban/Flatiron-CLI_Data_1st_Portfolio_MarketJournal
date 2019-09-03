class Newsjournal::CLI
    def contents

        self.news_greet
        self.news_articles
        self.news_articlemenu
        self.news_close

    end

    def news_greet
        Newsjournal::NewsGreet.newsStartGreet
        puts "--------------------------------------------------------------------------------------".blue
        puts "Here are the following Financial breaking news...".white.bold
        puts "--------------------------------------------------------------------------------------".blue
        Newsjournal::NewsScraper.get_articles
    end

    def news_tagarticle
        Newsjournal::NewsArticle.articles
    end

    def news_articles
        news_tagarticle.each_with_index{|ar, id| 
            puts "#{id + 1}- ".bold.green + "#{ar.article}".bold.yellow
        }
        puts "\n"
        puts "Type [ x ] to exit the app.".colorize(:color => :red).bold
        puts "--------------------------------------------------------------------------------------".blue
        puts "Select an Article ID to Read: ".bold.yellow
        #binding.pry
    end
    
    def news_articlemenu
        option = nil
        while option != "b"
            option = gets.strip.downcase

            if option.to_i > 40
                puts "Please enter 1 to 50 numerical options for article."
            else
                puts "Please enter or follow the screen option only"
            end 
            
            news_tagarticle.each_with_index{ |far, ind|
                link = far.full
                case option
                when "#{ind + 1}"
                   puts `clear`
                   #Launchy.open(link)
                   
                   puts "[- #{far.article} -] \n".bold.green
                   puts "| Summary |".bold
                   puts "#{far.sum}".white
                   puts "--------------------------------------------------------------------------------------\n".blue
                   puts "Date and Author:  #{far.date_auth}\n".light_blue
                   puts link.green
                   puts "\n"
                   puts "-> Type [ b ] to go back to main menu.".colorize(:color => :red).bold
                   puts "-> Type [ x ] to exit the app.".colorize(:color => :red).bold
                   puts "--------------------------------------------------------------------------------------\n"
                when "b"
                    puts `clear`
                    contents
                when "x"
                    news_close
                end
            }
        end
    end

    def news_close
        Newsjournal::NewsGreet.newsEndGreet
    end


end
