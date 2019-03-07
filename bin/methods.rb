require 'pry'

def clear_logs
    system "clear"
end

def first_prompt
    clear_logs
    puts "Welcome to the B-Corp Database! \n\nBegin by selecting one of our options:\n\n"
    puts "1) Filter by Country \n2) Filter by Industry \n3) Search by Company Name\n\n"
    puts "Select an option by entering the corresponding number or type 'exit' to leave the database..."
    first_response = gets.chomp
    if first_response != "exit"    
        first_menu(first_response)
    end
end
def first_menu(first_response)
    clear_logs
    case first_response
    when "1"
        clear_logs
        puts "\nSelect a country from the list of all countries with B-corporations:\n\n"
        counter = 0
        Country.all.order(:name).each do |country|
            counter+=1
            puts "#{counter}) #{country.name}\n"
            country.index = counter
        end
        all_index = counter+1
        puts "#{all_index}) Filter by all\n"
        puts "\n\nSelect an option by entering the corresponding number...\n\n"
        selected_country_index = gets.chomp.to_i
        if selected_country_index != all_index
            found_country = Country.find_by_index(selected_country_index)
            country_menu_1(found_country)
        end
    when "2"
        clear_logs
        puts "\nSelect an industry from the list of all industries with B-corporations:\n\n"
        counter = 0
        Industry.all.order(:name).each do |industry|
            if industry.name != ""
                counter+=1
                puts "#{counter}) #{industry.name}\n"
            end
        end
        puts "\n\nSelect an option by entering the corresponding number..."
    when "3"
        clear_logs
        puts "\nPlease type the full name of the company you are searching for.\n\n"
        second_response = gets.chomp
        if Company.names.include?(second_response)
            found_company = Company.all.find_by(name: second_response)
            clear_logs
            puts "Name: #{found_company.name}\n"
            puts "Products and Services: #{found_company.products_and_services}\n\n"
            puts "For more information, type 'info'.  If you would like to return to the main menu, type 'menu'"
            third_response = gets.chomp
            company_menu(third_response, found_company)
        else
            puts "\nUnfortunately, there is no company matching the name entered.\n"
            puts "Please press any key to return to the main menu."
            STDIN.getch
            first_prompt
        end
    else
        clear_logs
        puts "Please enter 1, 2 or 3.\n\n"
        puts "1) Filter by Country \n2) Filter by Industry \n3) Search by Company Name\n\n"
        first_response = gets.chomp
        first_menu(first_response)
    end
end

def company_menu(third_response, found_company)
    clear_logs
    case third_response
    when "info"
        puts "\n\n"
        found_company.info
    when "menu"
        puts "\n\n"
        first_prompt
    else
        puts "\n\nPlease type 'info' or 'menu'."
        third_response = gets.chomp
        company_menu(third_response, found_company)
    end
end

def country_menu_1(found_country)
    clear_logs
    puts "You have selected #{found_country.name}!\n\n"
    puts "Please select from the following options:\n\n"
    puts "1) Filter by #{found_country.name} industries\n"
    puts "2) See all #{found_country.name} companies by name\n"
    puts "3) List all #{found_country.name} companies ranked by impact score\n\n"
    puts "Select an option by entering the corresponding number...\n"
    response = gets.chomp
    country_menu_2(found_country, response)
end

def country_menu_2(found_country, response)
    case response
        when "1"
            clear_logs
            self.show_industries_by_name
            #more to be done here
        when "2"
            clear_logs
            self.show_companies_by_name
        when "3"
            clear_logs
            self.show_companies_by_score
        else
            puts "Please enter a valid response.\n\n"
            puts "1) Filter by #{found_country.name} industries\n"
            puts "2) See all #{found_country.name} companies by name\n"
            puts "3) List all #{found_country.name} companies ranked by impact score\n\n"
            puts "Select an option by entering the corresponding number...\n"
            response = gets.chomp
            country_menu_2(found_country, response)
    end
end
