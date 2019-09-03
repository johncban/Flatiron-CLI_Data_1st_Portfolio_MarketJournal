class Newsjournal::CLI
    def contents

        self.news_greet
        self.news_articles_post
        self.news_articlemenu
        self.news_close

    end

    def news_greet
        Newsjournal::NewsGreet.newsStartGreet
        puts "--------------------------------------------------------------------------------------".blue
        puts "Here are the following Financial breaking news...".white.bold
        puts "--------------------------------------------------------------------------------------".blue
        Newsjournal::NewsArticle.start_scrape
    end

    def news_articles
        Newsjournal::NewsArticle.articles#.take(40)
    end

    def news_articles_post
        #puts news_articles.length
        news_articles.each_with_index{|ar, id| 
            puts "#{id + 1}- ".bold.green + "#{ar.article}".bold.yellow
            puts "\n"
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

            if option.to_i > news_articles.length
                puts "Please enter 1 to #{news_articles.length} numerical options for article."
            else
                puts "Please enter or follow the screen option only"
            end 

            news_articles.each_with_index{ |far, ind|
                article_title = far.article
                fullarticle = far.full
                sumarticle = far.sum
                date_auth = far.date_auth

                case option
                when "#{ind + 1}"
                   puts `clear`                  
                   puts "[-- #{article_title} --]".bold.green
                   puts " -- #{date_auth} -- \n".yellow
                   if far.sum == ""
                    puts "    ---------- ! Summary Not Available. ! ----------    ".colorize(:color => :red).bold
                    puts "\n"
                   else 
                    puts "|-- Summary --|".bold
                    puts "------------------------------------------------------------------------------------------------".white
                    puts sumarticle.white
                    puts "------------------------------------------------------------------------------------------------".white
                    puts "\n"
                   end
                   puts "*************************************************************************************************\n".blue
                   if fullarticle == "                    "
                    puts "    ---- ! Full Article Not Available. Articles are for Paid Members Only. ! ----    ".colorize(:color => :red).bold
                    puts "\n"
                   else
                    puts "|-- Full Article --|".colorize(:color => :green).bold
                    puts fullarticle.green
                    puts "\n"
                   end
                   puts "*************************************************************************************************\n".blue
                   puts "\n"
                   puts "-> Type [ b ] to go back to main menu.".colorize(:color => :blue).bold
                   puts "-> Type [ x ] to exit the app.".colorize(:color => :blue).bold
                   
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