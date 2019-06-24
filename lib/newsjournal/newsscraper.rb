class Newsjournal::NewsScraper
    # Provide Base or Link URL to scrape.
    BASE_URL = 'https://www.marketwatch.com/latest-news'

    # Begin scraping process using nokogiri.
    def self.getNewsSource
        @dat = Nokogiri::HTML(HTTParty.get(BASE_URL)) # Scrape the BASE_URL.
        @dat.css("div.article__content")              # Target css class node to be scraped.
    end

    
    # Begin scraping the article headline, url, summary and date with author.
    def self.scrapeArticleHeadlines
        getNewsSource.each { |nw|    # Iterate with nw argument to get the individual scraped information values.
            sum = nw.css(".article__headline a.link").text.split.join(" ") # Detect if summary is empty.
            if sum == ""                                                   # If summary is empty remove the empty article using xpath.
                getNewsSource.xpath('//text()').find_all {|t| t.to_s.strip == ''}.collect(&:remove)
            else
                news = {                                                   # Hash the headline, url, sum and date or "block the code " for NewsArticle.
                    headline: nw.css(".article__headline a.link").text.split.join(" "),
                    url: nw.css(".article__headline a.link").collect { |list| list['href'] },
                    sum: nw.css(".article__summary").text.split.join(" "),
                    date_auth: nw.css(".article__details").text.split.join(" "),
                }
                Newsjournal::NewsArticle.new(news)                    # Initialize the news hash. 
            end
        }
        #binding.pry
    end

    # Begin scraping the individual url for full content of each article.
    def self.scrapeArticleContent(url)
        @contentsrc = Nokogiri::HTML(HTTParty.get(url))     # Get the url of each article as an agument.
        @contentsrc.xpath("//div[@id='article-body']").text.split.join(" ").rjust(20) # Scrape the specific xpath node to be scraped then split the array.
    end
end