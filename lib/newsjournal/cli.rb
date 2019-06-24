class Newsjournal::CLI
    def contents
        self.news_greet
        self.news_fetch
        self.news_articles
        self.news_close
    end

    def news_greet
        Newsjournal::NewsGreet.newsStartGreet
        puts "--------------------------------------------------------------------------------------".blue
        puts "Here are the following Financial breaking news...".bold.white
        puts "--------------------------------------------------------------------------------------".blue
    end

    def news_fetch
        Newsjournal::NewsScraper.scrapeArticleHeadlines

        bar = ProgressBar.new(100, :bar, :rate, :eta)

        100.times do
            sleep 0.1
            bar.increment!
        end

        puts "\n"
    end

    def news_articles
        headlines = Newsjournal::NewsArticle.allnews.take(40)
        headlines.each_with_index{|ar, id| puts "#{id + 1}. #{ar.headline}"}
        
        option = nil
        while option != "x"
            option = gets.strip.downcase
            headlines.each_with_index{ |e, i|
                case option
                when "#{i+1}"
                   puts `clear`
                   link = e.url.map(&:to_s).shift.strip
                   full_article = Newsjournal::NewsScraper.scrapeArticleContent(link)
                   puts "- #{e.headline} -".bold.green
                   puts "\n"
                   puts "Summary".bold
                   puts "#{e.sum}".white
                   puts "--------------------------------------------------------------------------------------".blue
                   puts "Date and Author:  #{e.date_auth}".light_blue
                   puts "\n"
                   puts "--------------------------------------------------------------------------------------".green
                   Launchy.open(link)
                   puts full_article.green
                   puts "--------------------------------------------------------------------------------------".green
                when "b"
                    puts `clear`
                    contents
                when "x"
                    news_close
                end
            }
        end

        puts "--------------------------------------------------------------------------------------".blue
        puts "Select an Article ID to Read".bold.white
        puts "--------------------------------------------------------------------------------------".blue
    end

    def news_close
        Newsjournal::NewsGreet.newsEndGreet
    end

end