require 'pry'

def clear_logs
    system "clear"
end

def first_prompt
    prompt = TTY::Prompt.new
    clear_logs
    puts "Welcome to the B-Corp Database! \n\n"
    puts "Certified B Corporations are businesses that meet the highest standards of verified social and environmental performance, public transparency, and legal accountability\nto balance profit and purpose. B Corps are accelerating a global culture shift to redefine success in business and build a more inclusive and sustainable economy.\n(credit: https://bcorporation.net/about-b-corps)\n\n"
    options = {"Filter by Country":1, "Filter by Industry":2, "Search by Company Name":3, "Exit Database":4}
    return_value = prompt.select("Begin by selecting one of our options:",options)
    first_menu(return_value)
end

def first_menu(first_response)
    prompt = TTY::Prompt.new
    clear_logs
    case first_response
    when 1
        clear_logs
        
        fill_hash = {}
        Country.all.order(:name).each do |country|
            fill_hash["#{country.name}"] = country.name 
        end
        
        return_value = prompt.select("\nSelect a country from the list of all countries with B-corporations:\n",fill_hash)
        
        found_country = Country.find_by(name: return_value)
        country_menu_1(found_country)
    when 2
        clear_logs

        fill_hash = {}
        Industry.all.order(:name).each do |industry|
            if industry.name != ""
                fill_hash["#{industry.name}"] = industry.name
            end
        end

        return_value = prompt.select("\nSelect an industry from the list of all industries with B-corporations:\n\n",fill_hash)
        found_industry = Industry.find_by(name: return_value)
        industry_menu_1(found_industry)
    when 3
        clear_logs
        puts "\nPlease type the full name of the company you are searching for.\n\n"
        second_response = gets.chomp
        company_menu_1(second_response)
    end
end

def company_menu_1(response)
    prompt = TTY::Prompt.new
    if Company.names.include?(response)
        found_company = Company.all.find_by(name: response)
        clear_logs
        puts "Name: #{found_company.name}\n"
        puts "Products and Services: #{found_company.products_and_services}\n\n"
        return_value = prompt.select("For more information, select 'Info'.  If you would like to return to the main menu, select 'Menu'", {"Info": "info","Menu": "menu"})
        company_menu_2(return_value, found_company)
    else
        puts "\nUnfortunately, there is no company matching the name entered.\n"
        puts "Please press 'q' to return to the main menu."
        loop do 
            ch = STDIN.getch
            if ch == "q"
                break
            end
        end
        first_prompt
    end
end

def company_menu_2(third_response, found_company)
    clear_logs
    case third_response
    when "info"
        puts "\n\n"
        found_company.info
    when "menu"
        puts "\n\n"
        first_prompt
    end
end

def country_menu_1(found_country)
    clear_logs
    puts "You have selected #{found_country.name}!\n\n"
    prompt = TTY::Prompt.new
    return_value = prompt.select("Please select from the following options:",{"Filter by #{found_country.name} industries":1,"See all #{found_country.name} companies by name":2,"List all #{found_country.name} companies ranked by impact score":3,"Return to main menu":4})
    country_menu_2(found_country, return_value)
end

def country_menu_2(found_country, return_value)
    prompt = TTY::Prompt.new
    case return_value
        when 1
            clear_logs
            fill_hash = {}
            found_country.industries.order(:name).each do |industry|
                fill_hash["#{industry.name}"] = industry
            end
            return_value_industry = prompt.select("\nMake a selection from all industries with B-Corporations present in #{found_country.name}:\n",fill_hash)
            country_industry_menu(found_country, return_value_industry)
            #more to be done here
        when 2
            clear_logs
            fill_hash = {}
            found_country.companies.order(:name).each do |company|
                fill_hash["#{company.name}"] = company.name
            end
            return_value = prompt.select("\nSelect a company from the list of all B-Corporations in #{found_country.name}:\n",fill_hash)
            company_menu_1(return_value)
        when 3
            clear_logs
            fill_hash = {}
            found_country.companies.order(overall_score: :desc).each do |company|
                fill_hash["#{company.name} - Overall Score: #{company.overall_score}"] = company.name
            end
            return_value = prompt.select("\nSelect a company from the list of all B-corporations in #{found_country.name}:\n",fill_hash)
            company_menu_1(return_value)
        when 4
            first_prompt
    end
end

def industry_menu_1(found_industry)
    clear_logs
    puts "You have selected #{found_industry.name}!\n\n"
    prompt = TTY::Prompt.new
    return_value = prompt.select("Please select from the following options:",{"Filter by countries that have B-Corps within the #{found_industry.name} industry":1,"See all #{found_industry.name} companies by name":2,"List all #{found_industry.name} companies ranked by impact score":3,"Return to main menu":4})
    industry_menu_2(found_industry, return_value)
end

def industry_menu_2(found_industry, return_value)
    prompt = TTY::Prompt.new
    case return_value
        when 1
            clear_logs
            fill_hash = {}
            found_industry.countries.order(:name).each do |country|
                fill_hash["#{country.name}"] = country
            end
            return_value_country = prompt.select("\nMake a selection from all countries with B-Corporations present in the #{found_industry.name} industry:\n",fill_hash)
            country_industry_menu(return_value_country, found_industry)
        when 2
            clear_logs
            fill_hash = {}
            found_industry.companies.order(:name).each do |company|
                fill_hash["#{company.name}"] = company.name
            end
            return_value = prompt.select("\nSelect a company from the list of all B-corporations in the #{found_industry.name} industry:\n",fill_hash)
            company_menu_1(return_value)
        when 3
            clear_logs
            fill_hash = {}
            found_industry.companies.order(overall_score: :desc).each do |company|
                fill_hash["#{company.name} - Overall Score: #{company.overall_score}"] = company.name
            end
            return_value = prompt.select("\nSelect a company from the list of all B-corporations in the #{found_industry.name} industry:\n",fill_hash)
            company_menu_1(return_value)
        when 4
            first_prompt
    end
end

def country_industry_menu(country,industry)
    puts "\nplease wait...\n\n"
    prompt = TTY::Prompt.new
    companies = []
    Company.all.order(:name).each do |company|
        if country == company.country && industry == company.industry
            companies << company
        end
    end
    fill_hash={}
    companies.each do |company|
        fill_hash["#{company.name}"] = company.name
    end
    return_value = prompt.select("\nSelect a company from the list of all B-corporations that are in the #{country.name} #{industry.name} industry:\n",fill_hash)
    company_menu_1(return_value)
end
