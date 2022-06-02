class City < ApplicationRecord
    belongs_to :region
    scope :filter_by_population_max, -> (pop_max) { where population: ..pop_max }
    scope :filter_by_population_min, -> (pop_min) { where population: pop_min.. }
    scope :filter_by_monthly_after_tax_salary, -> (salary_min) { where monthly_after_tax_salary: salary_min.. }
    scope :filter_by_coastal, -> (coastal) { where coastal: coastal }
    scope :filter_by_on_water, -> (on_water) { where on_water: on_water }
    scope :filter_by_apt_price_per_meter2_inside_city_center, -> (price_max) { where apt_price_per_meter2_inside_city_center: ..price_max }
    scope :filter_by_apt_price_per_meter2_outside_city_center, -> (price_max) { where apt_price_per_meter2_outside_city_center: ..price_max }
    scope :filter_by_monthly_rent_one_bdrm_inside_city_center, -> (rent_max) { where monthly_rent_one_bdrm_inside_city_center: ..rent_max }
    scope :filter_by_monthly_rent_one_bdrm_outside_city_center, -> (rent_max) { where monthly_rent_one_bdrm_outside_city_center: ..rent_max }
    scope :filter_by_monthly_internet, -> (internet_max) { where monthly_internet: ..internet_max }
    scope :filter_by_monthly_utilities, -> (utilities_max) { where monthly_utilities: ..utilities_max }

    def within_rad(lat_given, lon_given, distance)
        d = get_distance_between_lat_lon(lat_given, lon_given)
        distance-d>=0
    end

    def get_distance_between_lat_lon(lat_given, lon_given)
        lat_city = self.latitude
        lon_city = self.longitude
        r_miles = 3963
        deg_lat = deg_to_rad(lat_city-lat_given)
        deg_lon = deg_to_rad(lon_city-lon_given)
        a = Math.sin(deg_lat/2) * Math.sin(deg_lat/2) + Math.cos(deg_to_rad(lat_given)) * Math.cos(deg_to_rad(lat_city)) * Math.sin(deg_lon/2) * Math.sin(deg_lon/2)
        c = 2 * Math.atan2(Math.sqrt(a), Math.sqrt(1-a))
        r_miles * c
    end

    def deg_to_rad (deg)
        deg * (Math::PI/180)
    end
end

