class PagesController < ApplicationController
  skip_before_action :authenticate_user!, only: [ :home ]

  def home
    qrcode = RQRCode::QRCode.new("www.github.com/confirmation?user=1")

    # NOTE: showing with default options specified explicitly
    @svg = qrcode.as_svg(
      color: "000",
      shape_rendering: "crispEdges",
      module_size: 11,
      standalone: true,
      use_path: true
    )
  end
end
