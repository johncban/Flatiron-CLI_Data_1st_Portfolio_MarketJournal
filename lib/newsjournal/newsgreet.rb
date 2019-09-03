class Newsjournal::NewsGreet
    def self.newsStartGreet
        current_td = Time.now
        puts `clear`
        puts "\n"
        puts "TODAY IS: ".bold.white + "#{current_td}".bold.yellow
        news_start_greet = <<-'EOF'

 _    _        _                                _           _    _             _   _                      
 | |  | |      | |                              | |         | |  | |           | \ | |                     
 | |  | |  ___ | |  ___  ___   _ __ ___    ___  | |_  ___   | |_ | |__    ___  |  \| |  ___ __      __ ___ 
 | |/\| | / _ \| | / __|/ _ \ | '_ ` _ \  / _ \ | __|/ _ \  | __|| '_ \  / _ \ | . ` | / _ \\ \ /\ / // __|
 \  /\  /|  __/| || (__| (_) || | | | | ||  __/ | |_| (_) | | |_ | | | ||  __/ | |\  ||  __/ \ V  V / \__ \
  \/  \/  \___||_| \___|\___/ |_| |_| |_| \___|  \__|\___/   \__||_| |_| \___| \_| \_/ \___|  \_/\_/  |___/
                                                                                                           
                                                                                                           
 
        EOF
        puts "#{news_start_greet}".blue.bold
        puts "A Ruby CLI Gem that reports the whole news using both the terminal and you're web browser!".bold.green
        puts "\n"
    end



    def self.newsEndGreet

        news_end_greet = <<-'EOF'
 _____  _                    _            __                                
 |_   _|| |                  | |          / _|                               
   | |  | |__    __ _  _ __  | | __ ___  | |_   ___   _ __                   
   | |  | '_ \  / _` || '_ \ | |/ // __| |  _| / _ \ | '__|                  
   | |  | | | || (_| || | | ||   < \__ \ | |  | (_) || |                     
   \_/  |_| |_| \__,_||_| |_||_|\_\|___/ |_|   \___/ |_|                     
 ______                   _  _                 _    _                        
 | ___ \                 | |(_)               | |  | |                       
 | |_/ /  ___   __ _   __| | _  _ __    __ _  | |_ | |__    ___              
 |    /  / _ \ / _` | / _` || || '_ \  / _` | | __|| '_ \  / _ \             
 | |\ \ |  __/| (_| || (_| || || | | || (_| | | |_ | | | ||  __/             
 \_| \_| \___| \__,_| \__,_||_||_| |_| \__, |  \__||_| |_| \___|             
  _   _                          ___    __/ |                           _  _ 
 | \ | |                        |_  |  |___/                           | || |
 |  \| |  ___ __      __ ___      | |  ___   _   _  _ __  _ __    __ _ | || |
 | . ` | / _ \\ \ /\ / // __|     | | / _ \ | | | || '__|| '_ \  / _` || || |
 | |\  ||  __/ \ V  V / \__ \ /\__/ /| (_) || |_| || |   | | | || (_| || ||_|
 \_| \_/ \___|  \_/\_/  |___/ \____/  \___/  \__,_||_|   |_| |_| \__,_||_|(_) 
        EOF

        puts `clear`
        puts "#{news_end_greet}".white.bold
        sleep(0.8)
        puts `clear`
        exit!
    
    end



end