require 'open_weather'

class CustomersController < ApplicationController
  before_action :set_customer, only: [:show, :edit, :update, :destroy]

  # GET /customers
  # GET /customers.json
  def index
    @customers = Customer.all
    @hash = Gmaps4rails.build_markers(@customers) do |customer, marker|
      marker.lat customer.latitude
      marker.lng customer.longitude
      options = { units: "metric", APPID: "c8ede9021d3ebaacf3f144b672b393b1"}
      response = OpenWeather::Current.geocode(customer.latitude, customer.longitude, options)
      temp = response["main"]["temp"]
      marker.infowindow "<p style='font-family: Verdana; font-size: 12px; color: blue;'>Customer: #{customer.name}<br> Age: #{customer.age}<br> Inf- #{customer.more_info}<br>Temp: #{temp} Celcius</p>"
    end
  end

  # GET /customers/1
  # GET /customers/1.json
  def show
    @customer
    @hash = Gmaps4rails.build_markers(@customer) do |customer, marker|
      marker.lat customer.latitude
      marker.lng customer.longitude
      options = { units: "metric", APPID: "c8ede9021d3ebaacf3f144b672b393b1"}
      response = OpenWeather::Current.geocode(customer.latitude, customer.longitude, options)
      temp = response["main"]["temp"]
      marker.infowindow "<p style='font-family: Verdana; font-size: 12px; color: blue;'>Customer: #{customer.name}<br> Age: #{customer.age}<br> Inf- #{customer.more_info}<br>Temp: #{temp} Celcius</p>"
    end
  end

  # GET /customers/new
  def new
    @customer = Customer.new
  end

  # GET /customers/1/edit
  def edit
  end

  # POST /customers
  # POST /customers.json
  def create
    @customer = Customer.new(customer_params)

    respond_to do |format|
      if @customer.save
        format.html { redirect_to @customer, notice: 'Customer was successfully created.' }
        format.json { render :show, status: :created, location: @customer }
      else
        format.html { render :new }
        format.json { render json: @customer.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /customers/1
  # PATCH/PUT /customers/1.json
  def update
    respond_to do |format|
      if @customer.update(customer_params)
        format.html { redirect_to @customer, notice: 'Customer was successfully updated.' }
        format.json { render :show, status: :ok, location: @customer }
      else
        format.html { render :edit }
        format.json { render json: @customer.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /customers/1
  # DELETE /customers/1.json
  def destroy
    @customer.destroy
    respond_to do |format|
      format.html { redirect_to customers_url, notice: 'Customer was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_customer
      @customer = Customer.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def customer_params
      params.require(:customer).permit(:latitude, :longitude, :name, :address, :more_info, :age)
    end
end
