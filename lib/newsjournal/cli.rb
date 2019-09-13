class Newsjournal::CLI
    def contents
        self.news_greet
        self.news_articles
        self.news_articlemenu
        self.news_close
    end

    def news_greet
        Newsjournal::NewsGreet.newsStartGreet
        Newsjournal::NewsScraper.get_articles
        puts "--------------------------------------------------------------------------------------".blue
        puts "Here are the following #{article_count} breaking news...".white.bold
        puts "--------------------------------------------------------------------------------------".blue
    end

    def get_article_headlines
        Newsjournal::NewsArticle.articles
    end

    def article_count
        get_article_headlines.length
    end

    def screen_clear
        if Gem.win_platform?
          system 'cls'
        else
          system 'clear'
        end
    end

    def news_articles
        get_article_headlines.each_with_index{|ar, id| 
            puts "#{id + 1}".yellow + " ‣ " + "#{ar.article}".bold.yellow + " ⬡ " + "#{ar.date_stamp}"
        }
        puts "\n"
        puts "Type [ x ] to exit the app.".colorize(:color => :red).bold
        puts "--------------------------------------------------------------------------------------".blue
        puts "Select an Article ID to Read: ".bold.yellow
    end
    
    def news_articlemenu
        option = nil
        prompt = TTY::Prompt.new 

        while option != "x"
            option = gets.strip.downcase

            if option.to_i > article_count
                puts "Please enter 1 to #{article_count} numerical options for article."
            else
                puts "Please enter or follow the screen option only."
            end 
            
            #article = Newsjournal::NewsArticle.all[option - 1]

            #get_fullarticle(article.url)

            get_article_headlines.each_with_index { |far, ind|
                article_title = far.article
                full_article = far.full
                sum_article = far.sum
                date_author = far.date_auth
                webbrowser = far.url

                case option
                when "#{ind + 1}"
                   screen_clear
                   #Launchy.open(link)
                   
                   puts "[- #{article_title} -]".bold.green
                   puts " - #{date_author} - \n".yellow
                   
                   if sum_article == "" || sum_article == nil 
                      puts "--------------------------------------------------------------------------------------".red
                      puts "-- !! Summary Not Available !! --".colorize(:color => :red).bold
                      puts "--------------------------------------------------------------------------------------".red
                   else 
                      puts "\n"
                      puts "| Summary |".colorize(:color => :white).bold
                      puts "\n"
                      puts "#{far.sum}".white
                      puts "\n"
                   end

                   if full_article == "                    " || full_article == nil
                      puts "--------------------------------------------------------------------------------------".red
                      puts "-- !! Full Article is Only Available for Subscribers !! --".colorize(:color => :red).bold
                      puts "--------------------------------------------------------------------------------------".red
                      response = prompt.select("Do you wanted to read the article online from external source?", ["yes", "no"])
                      puts "\n"
                   else 
                      puts "--------------------------------------------------------------------------------------".blue
                      puts "\n"
                      puts full_article.green
                      puts "\n"
                      puts "--------------------------------------------------------------------------------------".blue
                      response = prompt.select("Do you wanted to read the article online?", ["yes", "no"])
                      puts "\n"
                   end

                   if response == "yes"
                    Launchy.open(webbrowser)
                   end

                   
                   menu_response = prompt.select("Go back to Main Screen or Exit?", ["Go Back", "Exit"])

                   if menu_response == "Go Back"
                        screen_clear
                        get_article_headlines.clear
                        contents
                   elsif menu_response == "Exit"
                        news_close
                   end
                end
            }
        end
    end

    def news_close
        Newsjournal::NewsGreet.newsEndGreet
    end
end