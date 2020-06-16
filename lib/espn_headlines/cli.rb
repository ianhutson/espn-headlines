class EspnHeadlines::CLI
    def call
        headlines
        menu
        cya
    end

    def headlines
        puts "Current espn.com headlines:"
        @headlines = EspnHeadlines::Headline.now.last(7)
        @headlines.each.with_index(1) do |headline, i|
            puts "#{i}. " + (i == 7 ? "[ESPN+] " : "") + "#{headline.name}" 
        end
    end

    def menu
        input = nil
        while input != "exit"
        puts "Enter number corresponding with article you'd like to read. Enter 'headlines' to relist articles. Enter 'exit' to exit."
        input = gets.strip.downcase
        if input.to_i > 0
        the_headline = @headlines[input.to_i-1]
        puts "-------------------------------------------------------"
            if input.to_i > 0 && input.to_i < 7
                puts "#{the_headline.name}" 
            elsif input.to_i == 7 
                puts ((input.to_i-1) == 6 ? "[ESPN+] " : "") + "#{the_headline.name}"
            end
        puts the_headline.url
        puts "-------------------------------------------------------"
        puts ""
        the_headline.article.each do |p|
        puts p   
        puts ""
        end
        puts "-------------------------------------------------------"
        elsif input == "headlines"
            headlines
        elsif input == "exit"
            cya
        else
            puts "Error. Please type 'headlines' or 'exit'"
        end
        end
    end

    def cya
        puts "Goodbye."
        exit
    end

end