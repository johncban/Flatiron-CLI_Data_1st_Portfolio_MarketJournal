class Newsjournal::CLI
    def contents
        current_time
        news_greet
        news_articles
        news_articles_menu
        news_menu
        news_close
    end

    def current_time
        user_time = Newsjournal::NewsTime.currentTime
        user_time
    end

    def news_greet
        puts <<-'EOF'

 _    _        _                                _           _    _             _   _                      
 | |  | |      | |                              | |         | |  | |           | \ | |                     
 | |  | |  ___ | |  ___  ___   _ __ ___    ___  | |_  ___   | |_ | |__    ___  |  \| |  ___ __      __ ___ 
 | |/\| | / _ \| | / __|/ _ \ | '_ ` _ \  / _ \ | __|/ _ \  | __|| '_ \  / _ \ | . ` | / _ \\ \ /\ / // __|
 \  /\  /|  __/| || (__| (_) || | | | | ||  __/ | |_| (_) | | |_ | | | ||  __/ | |\  ||  __/ \ V  V / \__ \
  \/  \/  \___||_| \___|\___/ |_| |_| |_| \___|  \__|\___/   \__||_| |_| \___| \_| \_/ \___|  \_/\_/  |___/
                                                                                                           
                                                                                                           
 
        EOF
        puts "A Ruby CLI Gem that reports the whole news using both the terminal and you're web browser!".bold.green
        puts "--------------------------------------------------------------------------------------".blue
        puts "Here are the following Financial breaking news...".bold.white
        puts "--------------------------------------------------------------------------------------".blue
    end

    def news_articles
        breakingNews = Newsjournal::NewsScrape.todayNews
        breakingNews.each_with_index {|e, i|
            puts "[#{i+1}] - ".bold + "#{e[:headline]}".colorize(:color => :light_blue)
        }
        puts "--------------------------------------------------------------------------------------".blue
        puts "Select an Article ID to Read".bold.white
        puts "--------------------------------------------------------------------------------------".blue
    end

    def news_articles_menu
        input = nil
        while input != "X"
            #binding.pry
            
            puts "\n"
            puts "Type [ x ] to exit the app.".colorize(:color => :red).bold
            puts "Type [ b ] to go back to main menu.".colorize(:color => :light_red).bold
            puts "\n"

            input = gets.strip.downcase

            breaking = Newsjournal::NewsScrape.todayNews
            breaking.each_with_index{ |e, i|
                #binding.pry

                case input
                when "#{i+1}"
                   puts `clear`
                   link = e[:url].map(&:to_s).shift.strip
                   ar_content = Newsjournal::NewsScrape.scrapeArticleContent(link)
                   puts "- #{e[:headline]} -".bold.green
                   puts "\n"
                   puts "Summary".bold
                   puts "#{e[:sum]}".white
                   puts "--------------------------------------------------------------------------------------".blue
                   puts "Date and Author:  #{e[:date_auth]}".light_blue
                   puts "\n"
                   puts "--------------------------------------------------------------------------------------".green
                   Launchy.open(link)
                   puts ar_content.green
                   puts "--------------------------------------------------------------------------------------".green
                when "b"
                    puts `clear`
                    contents
                when "x"
                    news_close
                end
            }
        end
    end

    def news_menu
        news_articles_menu
    end


    def news_close
        puts `clear`
        puts "Thanks for Reading the News Journal!".white.bold
        exit!
    end

end