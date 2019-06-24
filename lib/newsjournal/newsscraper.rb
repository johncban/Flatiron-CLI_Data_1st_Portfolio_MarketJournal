

class Newsjournal::NewsScrape

    #attr_accessor :headline, :url, :sum, :date_auth, :article_content
    
 
    NEWS_URL = 'https://www.marketwatch.com/story'

    def self.getNewsSource
        Nokogiri::HTML(HTTParty.get(NEWS_URL))
    end

=begin
    def self.scrapeArticles
        getNewsSource.css("div.article__content")
    end
=end

    def self.scrapeLatestArticles
        list_articles = getNewsSource.css("div.article__content")
        list_articles.each { |ar|
            input = {
                ar_headline: ar.css(".article__headline").text.split.join(" "),
                ar_url: ar.css("a.link").attr('href').text
            }

            Newsjournal::NewsArticle.new(input)
            binding.pry
        }
    end


    def self.scrapeArticleContent(url)
        @doc = Nokogiri::HTML(HTTParty.get(url))
        article_content = @doc.xpath("//div[@id='article-body']").text.split.join(" ").ljust(20)
    end

=begin
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
=end

end