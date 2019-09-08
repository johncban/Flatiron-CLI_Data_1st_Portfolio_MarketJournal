class Newsjournal::NewsArticle

    attr_reader :article, :url, :sum, :date_auth, :date_stamp
    attr_accessor :full

    @@articles = []
    
    def self.start_scrape
        Newsjournal::NewsScraper.get_articles
    end
    
    def self.articles
        @@articles
    end

    def initialize(article, url, full, sum, date_auth, date_stamp)
        @article = article
        @url = url
        @full = full
        @sum = sum 
        @date_auth = date_auth
        @date_stamp = date_stamp
        # @full = Newsjournal::NewsScraper.get_fullarticle(@url)
        @@articles << self
        #p @full
        #binding.pry
    end

end