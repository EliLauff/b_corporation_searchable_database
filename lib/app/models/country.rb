class Country < ActiveRecord::Base
    has_many :companies
    has_many :industries, through: :companies

    def show_industries_by_name
        counter = 0
        self.industries.order(:name).distinct.map do |industry|
            counter+=1
            "#{counter}) #{industry.name}\n"
        end
    end

    def show_companies_by_name
        counter = 0
        self.companies.order(:name).map do |company|
            counter += 1
            puts "#{counter}) #{company.name}\n"
        end
        return nil
    end

    def show_companies_by_score
        counter = 1
        self.companies.order(:overall_score).map do |company|
            "#{counter}) Name: #{company.name}, Overall Score: #{company.overall_score}"
            counter += 1
        end
    end

    
end