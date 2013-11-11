# encoding: utf-8

class MaintainController < ApplicationController
  def initialize
    super
    @style='maintain'
    @script='index'
    @controller_name='유지보수'
  end

  # GET /portfolios
  # GET /portfolios.json
  def index
    @maintain = Maintain.order('id desc').page(params[:page]).per(10)

    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @maintains }
    end
  end

  # GET /portfolios/1
  # GET /portfolios/1.json
  def show
    @maintain = Maintain.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @maintain }
    end
  end

  # GET /portfolios/new
  # GET /portfolios/new.json
  def new
    @maintain = Maintain.new
    @maintain.build_maintain_content    

    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @maintain }
    end
  end

  # GET /portfolios/1/edit
  def edit
    @maintain = Maintain.find(params[:id])
  end

  # POST /portfolios
  # POST /portfolios.json
  def create
    @maintain = Maintain.new(params[:maintain])

    respond_to do |format|
      if @maintain.save
        format.html { redirect_to @maintain, notice: 'Maintain was successfully created.' }
        format.json { render json: @maintain, status: :created, location: @maintain }
      else
        format.html { render action: "new" }
        format.json { render json: @maintain.errors, status: :unprocessable_entity }
      end
    end
  end

  # PUT /portfolios/1
  # PUT /portfolios/1.json
  def update
    @maintain = Maintain.find(params[:id])

    respond_to do |format|
      if @maintain.update_attributes(params[:maintain])
        format.html { redirect_to @maintain, notice: 'Maintain was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: "edit" }
        format.json { render json: @maintain.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /portfolios/1
  # DELETE /portfolios/1.json
  def destroy
    @maintain = Maintain.find(params[:id])
    @maintain.destroy

    respond_to do |format|
      format.html { redirect_to maintain_url }
      format.json { head :no_content }
    end
  end
end