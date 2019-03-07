class AddIndexToCompaniesIndustriesCountries < ActiveRecord::Migration[4.2]
    def change
        add_column :companies, :index, :integer
        add_column :industries, :index, :integer
        add_column :countries, :index, :integer
    end
end
