class Newsjournal::NewsArticle

    attr_reader :article, :url, :sum, :date_auth, :date_stamp
    attr_accessor :full

    @@articles = []
    
    def initialize(article, url, full, sum, date_auth, date_stamp)
        @article = article
        @url = url
        @full = full
        @sum = sum 
        @date_auth = date_auth
        @date_stamp = date_stamp

        @@articles << self
    end
    
    def self.articles
        #@@articles.sort { |article1, article2| article2.date_stamp <=> article1.date_stamp }
        @@articles
    end

end

#binding.pry



