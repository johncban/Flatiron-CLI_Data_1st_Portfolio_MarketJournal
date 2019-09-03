class Newsjournal::NewsArticle

    attr_reader :article, :url, :sum, :date_auth
    attr_accessor :full

    @@articles = []
    
    def self.start_scrape
        Newsjournal::NewsScraper.get_articles
    end
    
    def self.articles
        @@articles
    end

    def initialize(article, url, full, sum, date_auth)
        @article = article
        @url = url
        @full = full
        @sum = sum 
        @date_auth = date_auth
        @@articles << self
    end

end