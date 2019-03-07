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
            puts "#{counter}) Name: #{company.name}, Products and Services: #{company.products_and_services}\n"
        end
    end

    def show_companies_by_score
        counter = 1
        self.companies.order(:overall_score).map do |company|
            "#{counter}) Name: #{company.name}, Overall Score: #{company.overall_score}"
            counter += 1
        end
    end

    def self.find_by_index(given_index)
        Country.all.find do |country|
            country.index == given_index
        end
    end
end