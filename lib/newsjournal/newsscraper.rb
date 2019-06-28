class Newsjournal::NewsScraper
    # Provide Base or Link URL to scrape.
    BASE_URL = 'https://www.marketwatch.com/latest-news'

    # Begin scraping process using nokogiri.
    def self.get_source(url)
        Nokogiri::HTML(HTTParty.get(url)) # Scrape the BASE_URL.
    end

    def self.get_articletag
        dat = get_source(BASE_URL)
        dat.css("div.article__content")              # Target css class node to be scraped.
    end

    
    # Begin scraping the article headline, url, summary and date with author.
    def self.get_articles
        get_articletag.each { |n|
                article = n.css(".article__headline").text.split.join(" ")
                url = n.css(".article__headline a").attr("href").value 
                sum = n.css(".article__summary").text.split.join(" ")
                date_auth = n.css(".article__details").text.split.join(" ")
                
                if article == ""
                    get_articletag.xpath('//text()').find_all {|t| t.to_s.strip == ''}.collect(&:remove)
                elsif !Newsjournal::NewsArticle.articles.find { |o| o.article == article }
                    Newsjournal::NewsArticle.new(article, url, sum, date_auth)
                else 
                    Newsjournal::NewsArticle.articles
                end
        }
    end


    def self.get_fullarticle(article_url)
        contentsrc = get_source(article_url)     # Get the url of each article as an agument.
        contentsrc.xpath("//div[@id='article-body']").text.split.join(" ").rjust(20) # Scrape the specific xpath node to be scraped then split the array.
    end
end