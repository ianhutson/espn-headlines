class EspnHeadlines::Headline
attr_accessor :name, :url, :article, :author, :time
@@all = []

    def initialize(hash)
        hash.each do |key, value|
            self.send("#{key}=", value)
        end
        @@all.push(self)
    end

    def self.create(headlines)
        headlines.each do |headlines_hash|
            EspnHeadlines::Headline.new(headlines_hash)
        end
    end
    def self.all
        @@all
    end
    
end

#create a third scraper class
#headline class will save the information (@@all, save to @@all)
