class Newsjournal::NewsArticle

    attr_reader :headline, :url, :sum, :date_auth

    @@allarticles = []

    def self.allnews
        @@allarticles
    end

    def initialize(headline: headline, url: url, sum: sum, date_auth: date_auth)
        @headline = headline
        @url = url
        @sum = sum 
        @date_auth = date_auth
        @@allarticles << self
    end

end