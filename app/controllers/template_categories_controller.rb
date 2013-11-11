# encoding: utf-8

class TemplateCategoriesController < ApplicationController
  
  # GET /template_categories
  # GET /template_categories.json
  def index
    @template_categories=TemplateCategory.find(:all,:conditions=>{:enable=>1})

    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @template_categorys }
    end
  end

  # GET /template_categories/1
  # GET /template_categories/1.json
  def show
    @template_category_category = TemplateCategory.find(params[:id]) 

    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @template_category }
    end
  end

  # GET /template_categories/new
  # GET /template_categories/new.json
  def new
    @template_category = TemplateCategory.new

    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @template_category }
    end
  end

  # GET /template_categories/1/edit
  def edit
    @template_category = TemplateCategory.find(params[:id])
  end

  # POST /template_categories
  # POST /template_categories.json
  def create
    @template_category = TemplateCategory.new(params[:template])

    respond_to do |format|
      if @template_category.save
        format.html { redirect_to @template_category, notice: 'Template was successfully created.' }
        format.json { render json: @template_category, status: :created, location: @template_category }
      else
        format.html { render action: "new" }
        format.json { render json: @template_category.errors, status: :unprocessable_entity }
      end
    end
  end

  # PUT /template_categories/1
  # PUT /template_categories/1.json
  def update
    @template_category = TemplateCategory.find(params[:id])

    respond_to do |format|
      if @template_category.update_attributes(params[:template])
        format.html { redirect_to @template_category, notice: 'Template was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: "edit" }
        format.json { render json: @template_category.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /template_categories/1
  # DELETE /template_categories/1.json
  def destroy
    @template_category = TemplateCategory.find(params[:id])
    @template_category.destroy

    respond_to do |format|
      format.html { redirect_to templates_url }
      format.json { head :no_content }
    end
  end
end
