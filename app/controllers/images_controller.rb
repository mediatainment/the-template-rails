class ImagesController < MercuryController

  respond_to :json

  def create
    size_params = {width: params[:width], height: params[:height]}
    @mercury_image = MercuryImage.new(size_params)
    @mercury_image.image = params[:file] || params[:image][:image]
    @mercury_image.save!
    render text: "{\"image\":{\"id\":\"#{@mercury_image.id}\",\"url\":\"#{@mercury_image.image.url(:mercury)}\"}}"
  end

  def update
    image_params = params[:image]
    if image_params
      mercury_image = MercuryImage.find_or_create_by_name image_params.first[0]
      the_file = image_params.first[1]
      mercury_image.image.store!(the_file)
      mercury_image.update_attribte :image_url, mercury_image.image.file.path
      mercury_image.save!
    end

    render text: "{\"image\":{\"url\":\"#{mercury_image.image.to_s}\"}}"
  end

end