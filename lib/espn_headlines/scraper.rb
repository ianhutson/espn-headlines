class EspnHeadlines::Scraper
    def self.now
        doc = Nokogiri::HTML(open("https://espn.com"))
        doc.css("section.col-three ul.headlineStack__list li a").each do |headline|
            hl = EspnHeadlines::Headline.new
            hl.name = headline.text
            hl.url = "https://espn.com" + "#{headline.attr("href")}"
            html = (Nokogiri::HTML(open(hl.url)))
            article_html = html.css("div.article-body")
            arr = []
            article_html.css("p").each do |paragraph|
                arr << paragraph.text
                ""
            end
            hl.article = arr
            author_info = article_html.css("div.author.has-bio")
            author_title = author_info.css("span").text
            if author_info.text != ""
                hl.author = author_info.text.gsub(author_title, " - #{author_title}")
            elsif article_html.css("div.author span").text != article_html.css("div.author").text
                position = article_html.css("div.author span").text
                hl.author = article_html.css("div.author").text.gsub(position, " - #{position}")
            else 
                hl.author = article_html.css("div.author").text
            end
            hl.time = article_html.css("span.timestamp span.time").text
            hl.save
        end
    end
end