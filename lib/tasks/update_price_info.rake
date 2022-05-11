namespace :update_price_info do
    desc "update price info db tasks"
    task :my_task1 do
        puts "running a task"
        city1=City.find_by(city: "Baltimore")
        city2=City.find_by(city: "Huntington Beach")
        city1.update!(currency: "USD", monthly_utilities: 142.88, monthly_internet: 74.66, monthly_after_tax_salary: 3672.52, monthly_rent_one_bdrm_inside_city_center: 
            1593.06, monthly_rent_one_bdrm_outside_city_center: 1058.35, apt_price_per_meter2_inside_city_center: 2585.50, apt_price_per_meter2_outside_city_center: 1168.38, on_water: true, airport: "P-L")

        city2.update!(currency: "USD", monthly_utilities: nil, monthly_internet: 60.56, monthly_after_tax_salary: 4815.00, monthly_rent_one_bdrm_inside_city_center: 2255.56, monthly_rent_one_bdrm_outside_city_center: 1888.89, apt_price_per_meter2_inside_city_center: nil, apt_price_per_meter2_outside_city_center: nil, on_water: true, airport: "P-M")
        pp city1
        pp city2
    end
end
