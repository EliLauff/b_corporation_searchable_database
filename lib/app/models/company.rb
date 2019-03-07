class Company < ActiveRecord::Base
    belongs_to :industry
    belongs_to :country

    def info
    puts "Name: #{self.name}\n"
    puts "Current Status: #{self.current_status}\n\n"
    puts "Description: \n#{self.description}\n\n"
    puts "Industry: #{self.industry.name}\n"
    puts "Products and Services: #{self.products_and_services}\n"
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
end
end



