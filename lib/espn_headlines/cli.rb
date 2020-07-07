class EspnHeadlines::CLI
    def call
        create_articles
        home
        menu
        cya
    end
    def create_articles
        headlines = EspnHeadlines::Scraper.now
    end
    def home
        puts "Welcome!"
        art
        puts "Now loading..."
        @headlines = EspnHeadlines::Headline.all
        puts "Current ESPN.com headlines:"
        @headlines.each.with_index(1) do |headline, i|
            puts "#{i}. " + (i == 7 ? "[ESPN+] " : "") + "#{headline.name}" 
        end
        puts "Enter number corresponding with article you'd like to read. Enter 'refresh' to relist articles. Enter 'exit' to exit."
    end

    def menu
        input = nil
        while input != "exit"
        input = gets.strip.downcase
        if input.to_i > 0 && input.to_i < 8
        the_headline = @headlines[input.to_i-1]
        divide
            if input.to_i > 0 && input.to_i < 7
                puts "#{the_headline.name}" 
            elsif input.to_i == 7 
                puts ((input.to_i-1) == 6 ? "[ESPN+] " : "") + "#{the_headline.name}"
            end
        puts the_headline.url
        page_break
        puts the_headline.author
        puts the_headline.time
        divide
        page_break
        the_headline.article.each do |p|
            puts p   
            page_break
            end
        divide
        puts "Enter number corresponding with article you'd like to read. Enter 'refresh' to relist articles. Enter 'exit' to exit."
        elsif input == "refresh"
            home
        elsif input == "exit"
            cya
        else
            puts "Error: not a valid entry. Enter number (1 - 7) corresponding with article you'd like to read. Enter 'refresh' to relist articles. Enter 'exit' to exit."
        end
        end
    end

    def cya
        puts "Goodbye."
        exit
    end
    
    def page_break
        puts ""
    end

    def divide
        puts "--------------------------------------------------------------------------------------------------------------"
    end

    def art
        text = File.open("art.txt").read 
        text.each_line do |line|
          puts line
        end
    end
end