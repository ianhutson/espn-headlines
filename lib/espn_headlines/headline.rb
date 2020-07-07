class EspnHeadlines::Headline
attr_accessor :name, :url, :article, :author, :time
@@all = []

    def initialize
        @name = name
        @url = url
        @article = article
        @author = author
        @time = time
    end
    def save
        @@all << self
    end
    def self.all
        @@all
    end
    
end

#create a third scraper class
#headline class will save the information (@@all, save to @@all)
