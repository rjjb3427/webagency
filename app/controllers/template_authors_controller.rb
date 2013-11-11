# encoding: utf-8

class TemplateAuthorsController < ApplicationController
  
  # GET /template_authors
  # GET /template_authors.json
  def index
    @template_authors=TemplateAuthor.find(:all,:conditions=>{:enable=>1})

    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @template_authors }
    end
  end

  # GET /template_authors/1
  # GET /template_authors/1.json
  def show
    @template_author = TemplateAuthor.find(params[:id]) 

    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @template_author }
    end
  end

  # GET /template_authors/new
  # GET /template_authors/new.json
  def new
    @template_author = TemplateAuthor.new

    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @template_author }
    end
  end

  # GET /template_authors/1/edit
  def edit
    @template_author = TemplateAuthor.find(params[:id])
  end

  # POST /template_authors
  # POST /template_authors.json
  def create
    @template_author = TemplateAuthor.new(params[:template])

    respond_to do |format|
      if @template_author.save
        format.html { redirect_to @template_author, notice: 'Template was successfully created.' }
        format.json { render json: @template_author, status: :created, location: @template_author }
      else
        format.html { render action: "new" }
        format.json { render json: @template_author.errors, status: :unprocessable_entity }
      end
    end
  end

  # PUT /template_authors/1
  # PUT /template_authors/1.json
  def update
    @template_author = TemplateAuthor.find(params[:id])

    respond_to do |format|
      if @template_author.update_attributes(params[:template])
        format.html { redirect_to @template_author, notice: 'Template was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: "edit" }
        format.json { render json: @template_author.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /template_authors/1
  # DELETE /template_authors/1.json
  def destroy
    @template_author = TemplateAuthor.find(params[:id])
    @template_author.destroy

    respond_to do |format|
      format.html { redirect_to templates_url }
      format.json { head :no_content }
    end
  end
end
