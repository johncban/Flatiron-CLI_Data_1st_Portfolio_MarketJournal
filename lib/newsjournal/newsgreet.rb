class Newsjournal::NewsGreet
    def self.screen_clear
        if Gem.win_platform?
          system 'cls'
        else
          system 'clear'
        end
    end

    def self.newsStartGreet
        font = TTY::Font.new(:doom)
        current_td = Time.now
        screen_clear
        puts "\n"
        puts "TODAY IS: ".bold.white + "#{current_td}".bold.yellow
        news_start_greet = font.write("WELCOME TO THE NEWS", letter_spacing: 1)
        puts "#{news_start_greet}".blue.bold
        puts "A Ruby CLI Gem that reports the whole news using both the terminal and you're web browser!".bold.green
        puts "\n"
    end

    def self.newsEndGreet
        font = TTY::Font.new(:doom)
        news_end_greet = font.write("Thanks for Reading the NewsJournal!")
        screen_clear
        puts "#{news_end_greet}".green.bold
        sleep(0.7)
        screen_clear
        exit!
    end
end