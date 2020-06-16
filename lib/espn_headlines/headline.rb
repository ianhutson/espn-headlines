class EspnHeadlines::Headline
attr_accessor :name, :url, :article
    def self.now
       self.scrape
    end

    def self.scrape 
        doc = Nokogiri::HTML(open("https://espn.com"))
        headlines = []
        doc.css("ul.headlineStack__list li a").each do |headline|
            hl = self.new
            hl.name = headline.text
            hl.url = "https://espn.com" + headline.attr("href")
            html = (Nokogiri::HTML(open(hl.url)))
            article = html.css("div.article-body")
            arr =[]
            article.css("p").each do |paragraph|
                arr << paragraph.text
                ""
            end
            hl.article = arr
            headlines << hl
        end
        headlines
    end

end

