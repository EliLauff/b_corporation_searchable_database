class CreateCompanies < ActiveRecord::Migration[4.2]
    def change
        create_table :companies do |t|
            t.string :name
            t.boolean :current_status
            t.string :description
            t.integer :industry_id
            t.string :products_and_services
            t.integer :country_id
            t.string :size
            t.string :b_corp_profile_url
            t.string :website_url
            t.integer :assessment_year
            t.float :overall_score
            t.float :community_score
            t.float :customers_score
            t.float :environment_score
            t.float :governance_score
            t.float :workers_score
        end
    end
end
