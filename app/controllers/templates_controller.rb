# encoding: utf-8

class TemplatesController < ApplicationController  
  def initialize
    super
    @style='templates/index'
    @script='templates/index'
    @controller_name='템플릿'    
  end

  # GET /templates
  # GET /templates.json
  def index
    @products=Product.find(:all,:conditions=>{:enable=>true})
    @template_categories=TemplateCategory.find(:all,:conditions=>{:enable=>true})
    @template_authors=TemplateAuthor.find(:all,:conditions=>{:enable=>true})
    @template_types=TemplateType.find(:all,:conditions=>{:enable=>true})    
    @templates=Template.joins(:template_author)
    
    if(params[:template_category_id])
      @templates=@templates.where('template_categories.id IN(?)',params[:template_category_id]).includes(:template_categories)
    end
    
    if(params[:template_author_id])
      @templates=@templates.where('template_authors.id IN(?)',params[:template_author_id])
    end
    
    @templates=@templates.order('templates.id desc').includes(:template_type).page(params[:page]).per(60)        

    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @templates }
    end
  end

  # GET /templates/1
  # GET /templates/1.json
  def show
    @template = Template.find(params[:id])
    
    @style='templates/show'
    @script='templates/show'    

    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @template }
    end
  end

  # GET /templates/new
  # GET /templates/new.json
  def new
    @template = Template.new

    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @template }
    end
  end

  # GET /templates/1/edit
  def edit
    @template = Template.find(params[:id])
  end

  # POST /templates
  # POST /templates.json
  def create
    @template = Template.new(params[:template])

    respond_to do |format|
      if @template.save
        format.html { redirect_to @template, notice: 'Template was successfully created.' }
        format.json { render json: @template, status: :created, location: @template }
      else
        format.html { render action: "new" }
        format.json { render json: @template.errors, status: :unprocessable_entity }
      end
    end
  end

  # PUT /templates/1
  # PUT /templates/1.json
  def update
    @template = Template.find(params[:id])

    respond_to do |format|
      if @template.update_attributes(params[:template])
        format.html { redirect_to @template, notice: 'Template was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: "edit" }
        format.json { render json: @template.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /templates/1
  # DELETE /templates/1.json
  def destroy
    @template = Template.find(params[:id])
    @template.destroy

    respond_to do |format|
      format.html { redirect_to templates_url }
      format.json { head :no_content }
    end
  end
end
