class Newsjournal::NewsTime   # Rename to Greet

    def self.currentTime
        current_td = Time.now
        puts "Today is:  #{current_td}"
    end

    def self.newsGreet
        puts <<-'EOF'

 _    _        _                                _           _    _             _   _                      
 | |  | |      | |                              | |         | |  | |           | \ | |                     
 | |  | |  ___ | |  ___  ___   _ __ ___    ___  | |_  ___   | |_ | |__    ___  |  \| |  ___ __      __ ___ 
 | |/\| | / _ \| | / __|/ _ \ | '_ ` _ \  / _ \ | __|/ _ \  | __|| '_ \  / _ \ | . ` | / _ \\ \ /\ / // __|
 \  /\  /|  __/| || (__| (_) || | | | | ||  __/ | |_| (_) | | |_ | | | ||  __/ | |\  ||  __/ \ V  V / \__ \
  \/  \/  \___||_| \___|\___/ |_| |_| |_| \___|  \__|\___/   \__||_| |_| \___| \_| \_/ \___|  \_/\_/  |___/
                                                                                                           
                                                                                                           
 
        EOF
        puts "A Ruby CLI Gem that reports the whole news using both the terminal and you're web browser!".bold.green
    end
end