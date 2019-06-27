class Newsjournal::CLI
    def contents

        self.news_greet
        self.news_fetch
        self.news_articles
=begin
        self.news_close
=end
    end

    def news_greet
        Newsjournal::NewsGreet.newsStartGreet
        puts "--------------------------------------------------------------------------------------".blue
        puts "Here are the following Financial breaking news...".bold.white
        puts "--------------------------------------------------------------------------------------".blue
    end

    def news_fetch
        Newsjournal::NewsArticle.start_scrape
    end

    def news_articles
        latestnews = Newsjournal::NewsArticle.articles.take(40)
        latestnews.each_with_index{|ar, id| puts "#{id + 1}- ".bold.green + "#{ar.article}".white}
        puts "\n"
        puts "Type [ x ] to exit the app.".colorize(:color => :red).bold
        puts "--------------------------------------------------------------------------------------".blue
        puts "Select an Article ID to Read: ".bold.yellow

=begin
        option = nil
        while option != "b"
            option = gets.strip.downcase

            if option.to_i > 40
                puts "Please enter 1 to 40 numerical options for article."
            else
                puts "Please enter or follow the screen option only"
            end 
            headlines.each_with_index{ |far, ind|
                case option
                when "#{ind + 1}"
                   puts `clear`
                   link = far.url.map(&:to_s).shift.strip
                   Launchy.open(link)
                   full_article = Newsjournal::NewsScraper.scrapeArticleContent(link)
                   puts "[- #{far.headline} -] \n".bold.green
                   puts "- Summary -".bold
                   puts "#{far.sum}".white
                   puts "--------------------------------------------------------------------------------------\n".blue
                   puts "Date and Author:  #{far.date_auth}\n".light_blue
                   puts full_article.green
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
=end

    end

    def news_close
        Newsjournal::NewsGreet.newsEndGreet
    end
end