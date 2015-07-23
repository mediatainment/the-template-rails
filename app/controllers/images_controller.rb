class ImagesController < MercuryController


  #load_and_authorize_resource
  skip_authorization_check
  respond_to :json

  def create
    @mercury_image = MercuryImage.new(params[:image])
    @mercury_image.save!
    render text: "{\"image\":{\"url\":\"#{@mercury_image.image.to_s}\"}}"
  end

  def update
    image_params = params[:image]
    if image_params
      c = MercuryImage.find_or_create_by_name(image_params.first[0])
      the_file = image_params.first[1]
      c.image.store!(the_file)
      c.update_attribte :image_url, c.image.file.path
      c.save!
    end

    render text: "{\"image\":{\"url\":\"#{c.image.to_s}\"}}"
  end

end