def clear_logs
    system "clear"
end

def first_prompt
    clear_logs
    puts "Welcome to the B-Corp Database! \n\nBegin by selecting one of our options:\n\n"
    puts "1) Filter by Country \n2) Filter by Industry \n3) Search by Company Name\n\n"
    puts "Select an option by entering the corresponding number..."
    first_response = gets.chomp
    first_menu(first_response)
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
        end
        puts "\n\nSelect an option by entering the corresponding number..."
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
        found_company = Company.all.find_by(name: second_response)
        clear_logs
        puts "Name: #{found_company.name}\n"
        puts "Products and Services: #{found_company.products_and_services}\n\n"
        puts "For more information, type 'info'.  If you would like to return to the main menu, type 'menu'"
        third_response = gets.chomp
        company_menu(third_response, found_company)
    else
        clear_logs
        puts "Please enter 1, 2 or 3."
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
