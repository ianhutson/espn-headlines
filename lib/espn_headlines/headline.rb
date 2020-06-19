class EspnHeadlines::Headline
attr_accessor :name, :url, :article, :author, :time
    def self.now
        doc = Nokogiri::HTML(open("https://espn.com"))
        headlines = []
        doc.css("section.col-three ul.headlineStack__list li a").each do |headline|
            hl = self.new
            hl.name = headline.text
            hl.url = "https://espn.com" + "#{headline.attr("href")}"
            html = (Nokogiri::HTML(open(hl.url)))
            article = html.css("div.article-body")
            arr =[]
            article.css("p").each do |paragraph|
                arr << paragraph.text
                ""
            end
            hl.article = arr
            author_arr = []
            author_info = article.css("div.author.has-bio")
            author_title = author_info.css("span").text
            if author_info.text != ""
                hl.author = author_info.text.gsub(author_title, " - #{author_title}")
            elsif article.css("div.author span").text != article.css("div.author").text
                position = article.css("div.author span").text
                hl.author = article.css("div.author").text.gsub(position, " - #{position}")
            else 
                hl.author = article.css("div.author").text
            end
            hl.time = article.css("span.timestamp span.time").text
            headlines << hl
        end
        headlines
    end
end

