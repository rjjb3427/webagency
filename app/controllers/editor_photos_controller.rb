# encoding: utf-8

class EditorPhotosController < BoardController
  layout false
  # GET /photos
  # GET /photos.json
  def index
    @editor_photos = EditorPhoto.all

    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @editor_photos }
    end
  end

  # GET /photos/1
  # GET /photos/1.json
  def show
    @editor_photo = EditorPhoto.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @editor_photo }
      format.text { render :text=>"&bNewLine=true&sFileName=#{@editor_photo.photo.url}&sFileURL=#{@editor_photo.photo.medium_thumb}"}
    end
  end

  # GET /photos/new
  # GET /photos/new.json
  def new
    @editor_photo = EditorPhoto.new

    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @editor_photo }
    end
  end

  # GET /photos/1/edit
  def edit
    @editor_photo = EditorPhoto.find(params[:id])
  end

  # POST /photos
  # POST /photos.json
  def create
    @editor_photo = EditorPhoto.new(params[:editor_photo])

    respond_to do |format|
      if @editor_photo.save
        format.html { redirect_to @editor_photo, notice: 'Photo was successfully created.' }
        format.json {
          render json: @editor_photo, status: :created, location: @editor_photo }
        format.text {
          redirect_to(:controller=>:editor,:action=>:callback,:params=>{:callback_func=>params[:callback_func],:bNewLine=>'true',:sFileName=>@editor_photo.photo.url,:sFileURL=>@editor_photo.photo.large_thumb})
                }
      else
        format.html { render action: "new" }
        format.json { render json: @editor_photo.errors, status: :unprocessable_entity }
      end
    end
  end

  # PUT /photos/1
  # PUT /photos/1.json
  def update
    @editor_photo = EditorPhoto.find(params[:id])

    respond_to do |format|
      if @editor_photo.update_attributes(params[:editor_photo])
        format.html { redirect_to @editor_photo, notice: 'Photo was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: "edit" }
        format.json { render json: @editor_photo.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /photos/1
  # DELETE /photos/1.json
  def destroy
    @editor_photo = EditorPhoto.find(params[:id])
    @editor_photo.destroy

    respond_to do |format|
      format.html { redirect_to editor_photos_url }
      format.json { head :no_content }
    end
  end
end
