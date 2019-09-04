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
        article_count = Newsjournal::NewsArticle.articles.length
        puts "--------------------------------------------------------------------------------------".blue
        puts "Here are the following #{article_count} breaking news...".white.bold
        puts "--------------------------------------------------------------------------------------".blue
    end

    def news_tagarticle
        Newsjournal::NewsArticle.articles
    end

    def news_articles
        news_tagarticle.each_with_index{|ar, id| 
            puts "#{id + 1} - ".bold.green + "#{ar.article}".bold.yellow
        }
        puts "\n"
        puts "Type [ x ] to exit the app.".colorize(:color => :red).bold
        puts "--------------------------------------------------------------------------------------".blue
        puts "Select an Article ID to Read: ".bold.yellow
        #binding.pry
    end
    
    def news_articlemenu
        option = nil
        article_count = Newsjournal::NewsArticle.articles.length
        while option != "b"
            option = gets.strip.downcase

            if option.to_i > article_count
                puts "Please enter 1 to #{article_count} numerical options for article."
            else
                puts "Please enter or follow the screen option only"
            end 
            
            news_tagarticle.each_with_index{ |far, ind|
                article_title = far.article
                full_article = far.full
                sum_article = far.sum
                date_author = far.date_auth
                www = far.url

                case option
                when "#{ind + 1}"
                   puts `clear`
                   #Launchy.open(link)
                   
                   puts "[- #{article_title} -]".bold.green
                   puts " - #{date_author} - \n".yellow
                   
                   if sum_article == "" || sum_article == nil 
                      puts "-- !! Summary Not Available !! --"
                   else 
                      puts "| Summary |".bold
                      puts "#{far.sum}".white
                   end

                   if full_article == "                                            " || full_article == nil
                      puts "-- !! Full Article Only Available for Subscribers !! --"
                   else 
                      puts "--------------------------------------------------------------------------------------\n".blue
                      puts full_article.green
                      puts "--------------------------------------------------------------------------------------\n".blue
                   end

                   puts "\n"
                   puts "-> Type [ b ] to go back to main menu.".colorize(:color => :red).bold
                   puts "-> Type [ x ] to exit the app.".colorize(:color => :red).bold
                   
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
