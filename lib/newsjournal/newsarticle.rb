class Newsjournal::NewsArticle

    attr_reader :article, :url, :sum, :date_auth
    attr_accessor :full

    @@articles = []
        
    def self.articles
        @@articles
    end
    

    def initialize(article, url, full, sum, date_auth)
        @article = article
        @url = url
        @full = full
        @sum = sum 
        @date_auth = date_auth
        # @full = Newsjournal::NewsScraper.get_fullarticle(@url)
        @@articles << self
        #p @full
    end

end