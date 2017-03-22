Rails.application.config.middleware.use OmniAuth::Builder do
  provider  :facebook, 
            '233569517104162', '363d21877aeb38cd6671315ab110c944',
            scope: 'public_profile', display: 'page', image_size: 'square'
end