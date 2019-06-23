

class Newsjournal::NewsScrape

    attr_accessor :headline, :url, :sum, :date_auth, :article_content
 
    def self.getNewsSource
        news_source = 'https://www.marketwatch.com/story'
        Nokogiri::HTML(HTTParty.get(news_source))
    end

    def self.scrapeArticles
        getNewsSource.css("div.article__content")
    end

    def self.scrapeArticleContent(url)
        @doc = Nokogiri::HTML(HTTParty.get(url))
        article_content = @doc.xpath("//div[@id='article-body']").text.split.join(" ").ljust(20)
    end

    def self.todayNews
        article = []
        scrapeArticles.each { |n|
            headline = n.css(".article__headline a.link").text.split.join(" ")
            url = n.css(".article__headline a.link").collect { |list| list['href'] }
            sum = n.css(".article__summary").text.split.join(" ")
            date_auth = n.css(".article__details").text.split.join(" ")

            if headline == ""
                getNewsSource.xpath('//text()').find_all {|t| t.to_s.strip == ''}.collect(&:remove)
            else
                article << {headline: headline, url: url, sum: sum, date_auth: date_auth}
            end
        }
        article
    end
end