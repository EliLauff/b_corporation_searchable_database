class CreateIndustriesAndCountries < ActiveRecord::Migration[4.2]
    def change
        create_table :industries do |t|
            t.string :name
        end

        create_table :countries do |t|
            t.string :name
        end
    end
end
