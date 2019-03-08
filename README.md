# The Searchable B-Corporation Database

This database is used to demonstrate what we've learned about using ActiveRecord to access a Sqlite3 database, as well as modeling a many to many relationship in a practical manner.

The database was seeded using a CSV found at [data.world](https://data.world/blab/b-corp-impact-data) and aims to promote visibility of certified B-Corporations:

"Certified B Corporations are businesses that meet the highest standards of verified social and environmental performance, public transparency, and legal accountability to balance profit and purpose. B Corps are accelerating a global culture shift to redefine success in business and build a more inclusive and sustainable economy."

**Credit:** [About B-Corps](https://bcorporation.net/about-b-corps)

## Usage Guide

### Initial Setup

1. Fork and clone this repository to your local machine.
2. Navigate to the cloned directory.
3. Run `bundle install`.
4. Run `rake db:migrate`.
5. Run `rake db:seed` and wait a few moments while the database is populated.
6. You're ready to go! Run `bundle exec ruby bin/run.rb` from the main project directory to enter the database.

### Navigating the Database

The database was made with the intention of demonstrating object relationships between the models of companies, countries and industries.

- Each company has only one country and one industry.
- A country has many companies.
- An industry has many companies.
- Through companies, a country has many industries and an industry has many countries.

Begin your database search by selecting one of four options:

- Filter by country first.
- Filter by industry first.
- Search based on company name.
- Exit the database.

#### Option One - Filter by Country

Upon selecting this option you'll be given a list of all countries that have certified B-Corporations. Select one and you'll be brought to a menu for that country with the following options:

- Filter by industries present in that country, showing companies that belong to both the country and the industry.
- List all B-Corporations (ordered alphabetically by name) that are present in that country.
- List all B-Corporations (ordered based on their [overall impact score](https://bimpactassessment.net/?_ga=2.100383774.107426085.1551979435-1068982412.1551718081)) present in that country.
- Return to main menu.

Upon selecting a company, you'll be given a short description along with a decision to see more info or return to the main menu.

- The company **info page** contains info including the company's:

  - Name
  - Certification status
  - A brief description
  - Industry
  - Products and services offered
  - Country
  - Size
  - B-Corporation profile webpage
  - Company webpage
  - Overall Impact Score
  - Impact Score - Community
  - Impact Score - Customers
  - Impact Score - Environment
  - Impact Score - Governance
  - Impact Score - Workers

- You may return to the main menu from this page.

#### Option Two - Filter by Industry

Upon selecting this option you'll be given a list of all industries that have certified B-Corporations. Select one and you'll be brought to a menu for that industry with the following options:

- Filter by countries that have B-Corporations within that industry, showing companies that belong to both the industry and the country.
- List all B-Corporations (ordered alphabetically by name) that are present in that industry.
- List all B-Corporations (ordered based on their [overall impact score](https://bimpactassessment.net/?_ga=2.100383774.107426085.1551979435-1068982412.1551718081)) present in that industry.
- Return to main menu.

- Upon selecting a company, you'll be given a short description along with a decision to see more info (see company **info page** above) or return to the main menu.

#### Option Three - Search by Company Name

Upon selecting this option you'll be asked to type the full name of the company you're searching for. The search is case-sensitive and strict.

Upon a successful search, you'll be given a short description of the company along with a decision to see more info (see company **info page** above) or return to the main menu.

That's it! You're now a master. This database was designed to be simple in both design and usage.

#### Additional Help

A video demo has been uploaded in the root directory of this repository to demonstrate usage of the database.

## Contributors

- Eli Lauffenburger
- Thomas Hansen

## License and Citations

**This work is licensed under the terms of the MIT license.**

**B-Corporations Homepage:** [link](https://bcorporation.net/)

**CSV Source, data.world:** [link](https://data.world/blab/b-corp-impact-data)
