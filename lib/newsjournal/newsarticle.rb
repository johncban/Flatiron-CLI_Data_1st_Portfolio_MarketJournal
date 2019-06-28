class Newsjournal::NewsArticle

    attr_reader :article, :url, :sum, :date_auth
    
    @@articles = []
    
    def self.start_scrape
        Newsjournal::NewsScraper.get_articles
    end
    
    def self.articles
        @@articles
    end

    def initialize(article, url, sum, date_auth)
        @article = article
        @url = url
        @sum = sum 
        @date_auth = date_auth
        #@full = Newsjournal::NewsScraper.get_fullarticle(@url)
        @@articles << self
        #binding.pry
    end

end