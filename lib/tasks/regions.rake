namespace :regions do
  desc "TODO"
  task create_states: :environment do
    
  Region.create!(name: "Utah", country: "United States of America", tax_min:	4.95, tax_max: 4.95, income_min: 0, income_max: 0, political_party: "Democratic")
  Region.create!(name: "Vermont", country: "United States of America", tax_min:	3.35, tax_max: 8.75, income_min: 40350, income_max: 204000, political_party: "Democratic")
  Region.create!(name: "Virginia", country: "United States of America", tax_min:	2, tax_max: 5.75, income_min: 3000, income_max: 17001, political_party: "Democratic")

  Region.create!(name: "Washington", country: "United States of America", tax_min:	0, tax_max: 0, income_min: 0, income_max: 0, political_party: "Democratic")
  Region.create!(name: "District of Columbia", country: "United States of America", tax_min:	4, tax_max: 8.95, income_min: 10000, income_max: 1000000, political_party: "Democratic")
  Region.create!(name: "West Virginia", country: "United States of America", tax_min:	3, tax_max: 6.5, income_min: 10000, income_max: 60000, political_party: "Republican")
  Region.create!(name: "Wisconsin", country: "United States of America", tax_min:	3.54, tax_max: 7.65, income_min: 12120, income_max: 266930, political_party: "Democratic")
  Region.create!(name: "Wyoming", country: "United States of America", tax_min:	0, tax_max: 0, income_min: 0, income_max: 0, political_party: "Republican")
  end

  task update_cities: :environment do
    City.all.each do |city|
      region = Region.find_by(name: city.region_id)
      city.update!(region_id: region.id)
    end
  end
end
