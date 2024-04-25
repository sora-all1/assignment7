module ApplicationHelper
  def image_or_default_url(image)
    if image.present?
      image.url
    else
      asset_url('default_image.png') # デフォルトの画像のパスを指定
    end
  end
end
