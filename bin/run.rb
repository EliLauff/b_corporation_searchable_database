require 'pry'
require_relative '../config/environment'
puts Dir.pwd
# b_corp_table = CSV.parse('./lib/b_corp_impact_data.csv', headers: true)
# binding.pry
# puts b_corp_table[2]["company_name"]
stored_name = nil
parsed_countries = []
parsed_industries = []
CSV.foreach("./lib/b_corp_impact_data.csv", :encoding => 'windows-1251:utf-8') do |row|
    if stored_name != nil || stored_name != row[0]
        new_company = Company.new(name: row[0])
        new_company.current_status = row[2]
        new_company.description = row[3]
        new_company.industry = row[4]
        parsed_industries << row[4]
        new_company.products_and_services = row[6]
        new_company.country = row[7]
        parsed_countries << row[7]
        new_company.size = row[11]
        new_company.b_corp_profile_url = row[12]
        new_company.website_url = row[13]
        new_company.overall_score = row[15]
        new_company.community_score = row[17]
        new_company.customers_score = row[18]
        new_company.environment_score = row[19]
        new_company.governance_score = row[20]
        new_company.workers_score = row[21]
        new_company.save
    end 
    
    stored_name = row[0] 
end

parsed_industries = parsed_industries.uniq
parsed_countries = parsed_countries.uniq



puts "HELLO WORLD"