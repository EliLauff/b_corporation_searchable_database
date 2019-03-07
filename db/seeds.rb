Company.destroy_all
Industry.destroy_all
Country.destroy_all

stored_name = nil
CSV.foreach("./lib/b_corp_impact_data.csv", :encoding => 'windows-1251:utf-8') do |row|
    if stored_name != nil 
        if stored_name != row[0].to_s
            new_company = Company.new(name: row[0].to_s)
            industry_object = Industry.find_or_create_by(name: row[4].to_s.split.map(&:capitalize).join(' '))
            country_object = Country.find_or_create_by(name: row[7].to_s.split.map(&:capitalize).join(' '))
            industry_object.companies << new_company
            country_object.companies << new_company
            
            new_company.current_status = row[2].to_s.blank? ? "-" : row[2].to_s
            new_company.description = row[3].to_s.blank? ? "-" : row[3].to_s
            new_company.products_and_services = row[6].to_s.blank? ? "-" : row[6].to_s
            new_company.size = row[11].to_s.blank? ? "-" : row[11].to_s
            new_company.b_corp_profile_url = row[12].to_s.blank? ? "-" : (row[12].to_s.include?("http") ? row[12].to_s : row[12].to_s.prepend("http://"))
            new_company.website_url = row[13].to_s.blank? ? "-" : (row[13].to_s.include?("http") ? row[13].to_s : row[13].to_s.prepend("http://"))
            new_company.overall_score = row[15].to_s.blank? ? "-" : row[15].to_f
            new_company.community_score = row[17].to_s.blank? ? "-" : row[17].to_f
            new_company.customers_score = row[18].to_s.blank? ? "-" : row[18].to_f
            new_company.environment_score = row[19].to_s.blank? ? "-" : row[19].to_f
            new_company.governance_score = row[20].to_s.blank? ? "-" : row[20].to_f
            new_company.workers_score = row[21].to_s.blank? ? "-" : row[21].to_f

            new_company.save
            industry_object.save
            country_object.save
        end
    end
    
    
    
    stored_name = row[0] 
end