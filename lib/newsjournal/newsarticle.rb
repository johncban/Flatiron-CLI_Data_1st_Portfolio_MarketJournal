class Newsjournal::NewsArticle 

    @@all = []

    attr_accessor :ar_title, :ar_url

    def self.all
        @@all
    end

    def initialize(ar_title: ar_title, ar_url: ar_url)
        @ar_title = ar_title
        @ar_url = ar_url
        @@all << self
    end

end