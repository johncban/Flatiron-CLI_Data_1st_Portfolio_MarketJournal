class Newsjournal::NewsArticle

    @@all = []

    attr_accessor :ar_headline, :ar_url

    def self.all
        @@all
    end

    def initialize(ar_headline: ar_headline, ar_url: ar_url)
        @ar_headline = ar_headline
        @ar_url =ar_url
        @@all << self
    end

end