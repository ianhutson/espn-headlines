class EspnHeadlines::Scraper
    def self.now
        doc = Nokogiri::HTML(open("https://espn.com"))
        headlines = []
        doc.css("section.col-three ul.headlineStack__list li a").each do |headline|
            name = headline.text
            url = "https://espn.com" + "#{headline.attr("href")}"
            html = (Nokogiri::HTML(open(url)))
            article_html = html.css("div.article-body")
            arr = []
            article_html.css("p").each do |paragraph|
                arr << paragraph.text
                ""
            end
            article = arr
            author_info = article_html.css("div.author.has-bio")
            author_title = author_info.css("span").text
            if author_info.text != ""
                author = author_info.text.gsub(author_title, " - #{author_title}")
            elsif article_html.css("div.author span").text != article_html.css("div.author").text
                position = article_html.css("div.author span").text
                author = article_html.css("div.author").text.gsub(position, " - #{position}")
            else 
                author = article_html.css("div.author").text
            end
            time = article_html.css("span.timestamp span.time").text
            headlines.push({name: name, url: url, article: article, author: author, time: time})
        end
        headlines
    end
end