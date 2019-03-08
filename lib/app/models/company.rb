class Company < ActiveRecord::Base
    belongs_to :industry
    belongs_to :country

    def info
        clear_logs
        puts "Name: #{self.name}\n"
        puts "Current Status: #{self.current_status}\n\n"
        puts "Description: \n#{self.wrap_word(self.description)}\n\n"
        puts "Industry: #{self.industry.name}\n"
        puts "Products and Services: #{self.wrap_word(self.products_and_services)}\n"
        puts "Country of HQ: #{self.country.name}\n"
        puts "Number of Employees: #{self.size}\n\n"
        puts "Overall Impact Score: #{self.overall_score}\n"
        puts "Community Impact Score: #{self.community_score}\n"
        puts "Customer Impact Score: #{self.customers_score}\n"
        puts "Environment Impact Score: #{self.environment_score}\n"
        puts "Governance Impact Score: #{self.governance_score}\n"
        puts "Workers Impact Score: #{self.workers_score}\n\n"
        puts "B Corp Company Profile: #{self.b_corp_profile_url}\n"
        puts "Website: #{self.website_url}\n"
        puts "\n"
        puts "Please press any key to return to the main menu."
        STDIN.getch
        first_prompt
    end

    def wrap_word(string)
        array_of_characters = string.split("")
        new_string = []
        counter = 0
        array_of_characters.each do |character|
            if character == "\n"
                counter = 0
            elsif counter >= 135 && character == " "
                character = "\n"
                counter = 0
            end
            new_string << character
            counter += 1
        end
        new_string.join("").to_s
    end

    def self.names
        Company.all.map do |company|
            company.name
        end
    end
end



