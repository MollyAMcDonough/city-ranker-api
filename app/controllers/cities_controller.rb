# require 'byebug'

class CitiesController < ApplicationController
    rescue_from ActiveRecord::RecordNotFound, with: :render_not_found
    rescue_from ActiveRecord::RecordInvalid, with: :render_invalid

    # POST /cities
    def create
        city = City.create!(write_params)
        render json: city, status: :created
    end

    # PATCH /cities/id
    def update
        city = City.find(params[:id])
        city.update!(write_params)
        render json: city, status: :ok
    end

    # GET /cities/search
    def search
        puts "searching cities..."
        @cities = City.all
        search_params.each do |key, value|
            @cities = @cities.public_send("filter_by_#{key}", value) if value.present?
        end
        if params.key?(:distance)
            @cities = @cities.filter {|city| city.within_rad(params[:latitude].to_f, params[:longitude].to_f, params[:distance].to_i)}
        end
        if params.key?(:airport) && !@cities.empty?
            # if params[:airport] == "P-L"
            #     @cities = @cities.where(airport: "P-L")
            # end
            # elsif params
            case params[:airport]
            when "P-L"
                @cities = @cities.filter{|city| city.airport == "P-L"}
                # @cities = @cities.where(airport: "P-L")
            when "P-M"
                @cities = @cities.filter{|city| city.airport == "P-M" || city.airport == "P-L"}
                # @cities = @cities.where(airport: "P-L").or(@cities.where(airport: "P-M"))
            when "P-S"
                @cities = @cities.filter{|city| city.airport && city.airport != "P-N"}
            when "P-N"
                @cities = @cities.filter{|city| city.airport}
            end
        end

        render json: @cities, lat_given: params[:latitude].to_f, long_given: params[:longitude].to_f, status: :ok
    end

    private

    def search_params
        params.permit(:apt_price_per_meter2_inside_city_center, :apt_price_per_meter2_outside_city_center, :monthly_after_tax_salary, :monthly_internet,:monthly_rent_one_bdrm_inside_city_center, :monthly_rent_one_bdrm_outside_city_center, :monthly_utilities, :coastal, :on_water, :population_max, :population_min)
    end

    def write_params
        params.permit(:apt_price_per_meter2_inside_city_center, :apt_price_per_meter2_outside_city_center, :monthly_after_tax_salary, :monthly_internet,:monthly_rent_one_bdrm_inside_city_center, :monthly_rent_one_bdrm_outside_city_center, :monthly_utilities, :on_water, :population, :latitude, :longitude, :country, :region, :city, :currency, :elevation_meters, :wikidata_id)
    end

    def render_invalid (error)
        render json: { errors: error.record.errors.full_messages }, status: :unprocessable_entity
    end

    def render_not_found (error)
        render json: { errors: error.record.errors.full_messages }, status: :not_found
    end

end
