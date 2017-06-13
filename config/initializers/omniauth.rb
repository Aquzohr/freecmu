Rails.application.config.middleware.use OmniAuth::Builder do
  #OpenSSL::SSL::VERIFY_PEER = OpenSSL::SSL::VERIFY_NONE
  provider  :facebook, 
            '233569517104162', '363d21877aeb38cd6671315ab110c944',
            scope: 'public_profile', display: 'page', image_size: 'square',
            secure_image_url: 'true'
end