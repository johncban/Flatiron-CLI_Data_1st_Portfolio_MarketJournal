class Newsjournal::NewsScraper
    # Provide Base or Link URL to scrape.
    BASE_URL = 'https://www.marketwatch.com/latest-news'

    # Begin scraping process using nokogiri.
    def self.get_source(url)
        Nokogiri::HTML(HTTParty.get(url)) # Scrape the BASE_URL.
    end

    def self.get_articletag
        @dat = get_source(BASE_URL)
        @dat.css("div.component.component--module.more-headlines div.group.group--headlines div.article__content")              # Target css class node to be scraped.
    end

    def self.r_nil
        get_latest_headlines.xpath('//text()').find_all {|t| t.to_s.strip == ''}.collect(&:remove)
    end

    def self.get_fullarticle(full_article)
        contentsrc = get_source(full_article)     # Get the url of each article as an agument.
        contentsrc.xpath("//div[@id='article-body']").text.split.join(" ").rjust(20) # Scrape the specific xpath node to be scraped then split the array.
    end
    
    # Begin scraping the article headline, url, summary and date with author.
    def self.get_articles
        get_articletag.map { |breaking|
                    article = breaking.css("h3.article__headline").text.split.join(" ")
                    url = breaking.css("a.link").attr("href").value
                    sum = breaking.css("p.article__summary").text.split.join(" ")
                    date_auth = breaking.css("ul.article__details").text.split.join(" ")

                    if url == "#" || url == ""
                        r_nil 
                    elsif !Newsjournal::NewsArticle.articles.detect { |a| a.article == article }
                        full = get_fullarticle(url)
                        Newsjournal::NewsArticle.new(article, url, full, sum, date_auth)
                    end
                }
        #binding.pry
    end
end
