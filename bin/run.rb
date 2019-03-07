require 'pry'
require_relative '../config/environment'

puts "Welcome to the B-Corp Database! \n\nBegin by selecting one of our options:\n\n"
puts "1) Filter by Country \n2) Filter by Industry \n3) Search by Company Name\n\n"
puts "Select an option by entering the corresponding number..."
first_response = gets.chomp

case first_response
    when "1"
        puts "\nSelect a country from the list of all countries with B-corporations:\n\n"
        counter = 0
        Country.all.order(:name).each do |country|
            counter+=1
            puts "#{counter}) #{country.name}\n"
        end
        puts "\n\nSelect an option by entering the corresponding number..."
    when "2"
        puts "\nSelect an industry from the list of all industries with B-corporations:\n\n"
        counter = 0
        Industry.all.order(:name).each do |industry|
            if industry.name != ""
                counter+=1
                puts "#{counter}) #{industry.name}\n"
            end
        end
        puts "\n\nSelect an option by entering the corresponding number..."
    else
        puts "Please enter 1, 2 or 3."
        first_response = gets.chomp
end
    



puts "HELLO WORLD"