# require 'byebug'
class CitySerializer < ActiveModel::Serializer
  attributes :id, :city, :latitude, :longitude, :elevation_meters, :monthly_after_tax_salary, :apt_price_per_meter2_outside_city_center, :apt_price_per_meter2_inside_city_center, :monthly_rent_one_bdrm_outside_city_center, :monthly_rent_one_bdrm_inside_city_center, :monthly_utilities, :monthly_internet, :population, :on_water, :coastal, :airport, :distance
  has_one :region

  def distance
    lat = @instance_options[:lat_given]
    long = @instance_options[:long_given]
    # byebug
    object.get_distance_between_lat_lon(lat,long).round(2)
  end

end
