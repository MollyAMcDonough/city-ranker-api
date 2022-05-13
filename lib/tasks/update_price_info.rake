namespace :update_price_info do
    desc "update price info db tasks"
    task :my_task1 do
        puts "running a task"
        city1=City.find_by(city: "Savannah")
        city2=City.find_by(city: "Santa Cruz")
        city3=City.find_by(city: "Johnson City")
        city4=City.find_by(city: "Jacksonville")
        city5=City.find_by(city: "Wilmington")
        city6=City.find_by(city: "Knoxville")
        city7=City.find_by(city: "Chattanooga")
        city8=City.find_by(city: "Chicago")

        city1.update!(currency: "USD", monthly_utilities: 162.34, monthly_internet: 62.44, monthly_after_tax_salary: 2750.49, monthly_rent_one_bdrm_inside_city_center: 1457.14, monthly_rent_one_bdrm_outside_city_center: 980.00, apt_price_per_meter2_inside_city_center: 3196.14, apt_price_per_meter2_outside_city_center: 976.57, on_water: true, coastal: true, airport: "P-S")

        city2.update!(currency: "USD", monthly_utilities: 173.23, monthly_internet: 80.00, monthly_after_tax_salary: 4440.00, monthly_rent_one_bdrm_inside_city_center: 2125.00, monthly_rent_one_bdrm_outside_city_center: 1871.43, apt_price_per_meter2_inside_city_center: 6875.45, apt_price_per_meter2_outside_city_center: 6925.50, on_water: true, coastal: true, airport: nil)

        city3.update!(currency: "USD", monthly_utilities: 181.25, monthly_internet: 60.00, monthly_after_tax_salary: 2266.00, monthly_rent_one_bdrm_inside_city_center: 850.00, monthly_rent_one_bdrm_outside_city_center: 700.00, apt_price_per_meter2_inside_city_center: 1054.86, apt_price_per_meter2_outside_city_center: 835.28, on_water: false, coastal: false, airport: "P-N")

        city4.update!(currency: "USD", monthly_utilities: 180.01, monthly_internet: 58.00, monthly_after_tax_salary: 3422.00, monthly_rent_one_bdrm_inside_city_center: 719.83, monthly_rent_one_bdrm_outside_city_center: 643.75, apt_price_per_meter2_inside_city_center: 2421.88, apt_price_per_meter2_outside_city_center: 1883.68, on_water: true, coastal: false, airport: "P-N")


        city5.update!(currency: "USD", monthly_utilities: 191.34, monthly_internet: 82.14, monthly_after_tax_salary: 3009.00, monthly_rent_one_bdrm_inside_city_center: 999.00, monthly_rent_one_bdrm_outside_city_center: 791.00, apt_price_per_meter2_inside_city_center: 1811.03, apt_price_per_meter2_outside_city_center: 1468.26, on_water: true, coastal: true, airport: "P-S")

        city6.update!(currency: "USD", monthly_utilities: 134.41, monthly_internet: 62.82, monthly_after_tax_salary: 3003.29, monthly_rent_one_bdrm_inside_city_center: 1087.50, monthly_rent_one_bdrm_outside_city_center: 829.17, apt_price_per_meter2_inside_city_center: 2677.07, apt_price_per_meter2_outside_city_center: 1015.54, on_water: true, coastal: false, airport: "P-S")

        city7.update!(currency: "USD", monthly_utilities: 176.58, monthly_internet: 66.19, monthly_after_tax_salary: 2815.77, monthly_rent_one_bdrm_inside_city_center: 1166.67, monthly_rent_one_bdrm_outside_city_center: 899.90, apt_price_per_meter2_inside_city_center: 1966.05, apt_price_per_meter2_outside_city_center: 890.49, on_water: true, coastal: false, airport: "P-S")

        city8.update!(currency: "USD", monthly_utilities: 146.74, monthly_internet: 63.56, monthly_after_tax_salary: 4453.86, monthly_rent_one_bdrm_inside_city_center: 1882.42, monthly_rent_one_bdrm_outside_city_center: 1266.56, apt_price_per_meter2_inside_city_center: 5068.30, apt_price_per_meter2_outside_city_center: 2147.63, on_water: true, coastal: false, airport: "P-L")

        pp city1
        pp city2
        pp city3
        pp city4
        pp city5
        pp city6
        pp city7
        pp city8

    end

    task :update_coastal do
        cities = City.where(coastal: nil)
        cities.each do |city|
            city.update!(coastal: false)
        end
    end
end

# (currency: "USD", monthly_utilities: nil, monthly_internet: nil, monthly_after_tax_salary: nil, monthly_rent_one_bdrm_inside_city_center: nil, monthly_rent_one_bdrm_outside_city_center: nil, apt_price_per_meter2_inside_city_center: nil, apt_price_per_meter2_outside_city_center: nil, on_water: false, coastal: false, airport: nil)