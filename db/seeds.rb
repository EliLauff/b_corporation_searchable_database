Company.destroy_all
Industry.destroy_all
Country.destroy_all

stored_name = nil
CSV.foreach("./lib/b_corp_impact_data.csv", :encoding => 'windows-1251:utf-8') do |row|
    if stored_name != nil 
        if stored_name != row[0]
            new_company = Company.new(name: row[0])
            industry_object = Industry.find_or_create_by(name: row[4].to_s.split.map(&:capitalize).join(' '))
            country_object = Country.find_or_create_by(name: row[7].to_s.split.map(&:capitalize).join(' '))
            industry_object.companies << new_company
            country_object.companies << new_company
            
            new_company.current_status = row[2]
            new_company.description = row[3]
            new_company.products_and_services = row[6]
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
            industry_object.save
            country_object.save
        end
    end
    
    
    
    stored_name = row[0] 
end