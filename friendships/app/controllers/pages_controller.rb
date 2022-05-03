class PagesController < ApplicationController
  skip_before_action :authenticate_user!, only: [ :home ]

  def home
    @images = []
  
    # MiniMagick::Tool::Convert.new do |convert|
    #   convert << "https://cdn.shopify.com/s/files/1/0267/3606/6735/products/lv92p35ixfw0zx2q01uc36tbn2sq_800x.png?v=1648398224"
    #   convert.background 'red'
    #   convert.alpha 'remove'
    #   # convert << "output.jpg"
    #   convert << "output.png"
    #   @images << convert
    # end

    @image = MiniMagick::Image.open("https://cdn.shopify.com/s/files/1/0267/3606/6735/products/lv92p35ixfw0zx2q01uc36tbn2sq_800x.png?v=1648398224")
    @image.path #=> "/var/folders/k7/6zx6dx6x7ys3rv3srh0nyfj00000gn/T/magick20140921-75881-1yho3zc.jpg"
    # binding.pry
    @image.background 'red'
    @image.alpha 'remove'
    @image.format "jpg"

    send_data @image.to_blob, type: @image.mime_type
    # @image.write "storage/output.jpg"
    # @images << Rails.root.join("storage/output.jpg")
    # binding.pry
  end
end
