class Newsjournal::NewsArticle

    attr_reader :headline, :url, :sum, :date_auth

    @@allarticles = []

    def initialize(headline: headline, url: url, sum: sum, date_auth: date_auth)
        @headline = headline
        @url = url
        @sum = sum 
        @date_auth = date_auth
        @@allarticles << self
    end

    def self.allnews
        @@allarticles
    end

end